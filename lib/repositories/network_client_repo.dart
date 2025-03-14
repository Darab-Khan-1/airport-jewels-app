import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../utills/custom_snackbar.dart';
import 'exception.dart';
import 'shared_pref_repo.dart';

enum RequestType { post, get, delete, put, patch }

class RequestClient {
  final SharedPrefsRepository _sharedPrefsRepository;
  final Dio dio;

  RequestClient({
    required SharedPrefsRepository sharedPrefsRepository,
    Dio? dioInstance,
  })  : _sharedPrefsRepository = sharedPrefsRepository,
        dio = dioInstance ?? Dio() {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers.addAll(await _getHeaders());
          // Set a timeout of 2 minutes (120 seconds)
          options.sendTimeout = const Duration(minutes: 1);
          options.receiveTimeout = const Duration(minutes: 1);
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response); // Continue to the next middleware
        },
        onError: (DioException e, handler) {
          final networkError = NetworkException(
            type: _parseErrorType(e),
            message: e.message ?? 'An unknown error occurred',
            statusCode: e.response?.statusCode,
          );
          if (kDebugMode) {
            print('Network Error: $networkError');
          }
          handler.reject(
            DioException(
              requestOptions: e.requestOptions,
              response: e.response,
              type: e.type,
              error: networkError,
            ),
          );

          // Show toast if it's a timeout error
          if (e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout) {
            snackBarCustom(
              title: 'Network Error',
              message: "Please ensure you have a stable internet connection.",
              type: SnackBarType.error,
            );
          }
        },
      ),
    );
  }

  Future<Map<String, String>> _getHeaders() async {
    final token = _sharedPrefsRepository.authToken ?? '';
    return {
      "Content-Type": "application/json",
      if (token.isNotEmpty) "Authorization": "Bearer $token",
    };
  }

  NetworkErrorType _parseErrorType(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkErrorType.timeout;

      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400:
            return NetworkErrorType.badRequest;
          case 401:
            return NetworkErrorType.unauthorized;
          case 403:
            return NetworkErrorType.forbidden;
          case 404:
            return NetworkErrorType.notFound;
          case 500:
            return NetworkErrorType.serverError;
          default:
            return NetworkErrorType.unknown;
        }

      case DioExceptionType.cancel:
        return NetworkErrorType.cancelled;

      case DioExceptionType.unknown:
        return e.error is SocketException
            ? NetworkErrorType.noInternet
            : NetworkErrorType.unknown;

      default:
        return NetworkErrorType.unknown;
    }
  }

  Future<T> request<T>({
    required String url,
    required RequestType method,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? parser,
  }) async {
    try {
      final options = Options(contentType: Headers.jsonContentType);
      Response response;

      switch (method) {
        case RequestType.get:
          response = await dio.get(url, options: options, queryParameters: queryParameters);
          break;
        case RequestType.post:
          response = await dio.post(url, data: body, options: options);
          break;
        case RequestType.put:
          response = await dio.put(url, data: body, options: options);
          break;
        case RequestType.delete:
          response = await dio.delete(url, data: body, options: options);
          break;
        case RequestType.patch:
          response = await dio.patch(url, data: body, options: options);
          break;
      }

      if (parser != null) {
        return parser(response.data);
      }
      return response as T;
    } on DioException catch (e) {
      if (kDebugMode) {
        print('DioException: ${e.toString()}');
      }
      rethrow;
    } catch (e) {
      throw NetworkException(
        type: NetworkErrorType.unknown,
        message: 'Unexpected error: ${e.toString()}',
      );
    }
  }

  Future<T> getGoogleAutoAddress<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) parser,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      return parser(response.data);
    } on DioException catch (e) {
      throw NetworkException(
        type: _parseErrorType(e),
        message: e.message ?? 'An error occurred',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
