import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jewels_airport_transfers/models/car_model/car_model.dart';
import 'package:jewels_airport_transfers/models/country_model/country_model.dart';
import 'package:jewels_airport_transfers/models/login_model/login_model.dart';
import 'package:jewels_airport_transfers/models/port_model/port_model.dart';

import '../constants/common.dart';
import '../repositories/apis.dart';
import '../repositories/network_client_repo.dart';
import '../repositories/shared_pref_repo.dart';
import '../utills/logging.dart';

class ApiService{
  SharedPrefsRepository sharedPrefsRepository = SharedPrefsRepository();
  final _requestClient = RequestClient(
    sharedPrefsRepository: SharedPrefsRepository(),
  );

  Future<LoginModel?> loginApi(BuildContext context, Map<String, dynamic> request ) async {
    try {
      // Show loading indicator
      EasyLoading.show(
          status: "Logging in...", maskType: EasyLoadingMaskType.black, dismissOnTap: false );

      // Make the API request
      final response = await _requestClient.request(
        url: AppUrl.loginApi,
        method: RequestType.post,
        body: request,
      );

      // Handle the response
      final data = response.data;
      Logger.success(data.toString());
      return LoginModel.fromJson(data);
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (context.mounted) {
        Common.showDioErrorDialog(context, e: e);
      }

    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }

    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
    return null;
  }
  Future<CarsModel?> getAllCarsApi(BuildContext context, ) async {
    try {
      // Show loading indicator
      EasyLoading.show(
          status: "loading...", maskType: EasyLoadingMaskType.black, dismissOnTap: false );

      // Make the API request
      final response = await _requestClient.request(
        url: AppUrl.getAllCars,
        method: RequestType.get,
      );

      // Handle the response
      final data = response.data;
      Logger.success(data.toString());
      return CarsModel.fromJson(data);
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (context.mounted) {
        Common.showDioErrorDialog(context, e: e);
      }

    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }

    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
    return null;
  }
  Future<AllCountryModel?> getAllCountryApi(BuildContext context, ) async {
    try {
      // Show loading indicator
      EasyLoading.show(
          status: "Loading...", maskType: EasyLoadingMaskType.black, dismissOnTap: false );

      // Make the API request
      final response = await _requestClient.request(
        url: AppUrl.getAllCountries,
        method: RequestType.get,
      );

      // Handle the response
      final data = response.data;
      Logger.success(data.toString());
      return AllCountryModel.fromJson(data);
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (context.mounted) {
        Common.showDioErrorDialog(context, e: e);
      }

    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }

    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
    return null;
  }
  Future<PortsModel?> getAllPortsApi(BuildContext context, ) async {
    try {
      // Show loading indicator
      EasyLoading.show(
          status: "Loading...", maskType: EasyLoadingMaskType.black, dismissOnTap: false );

      // Make the API request
      final response = await _requestClient.request(
        url: AppUrl.getAllPorts,
        method: RequestType.get,
      );

      // Handle the response
      final data = response.data;
      Logger.success(data.toString());
      return PortsModel.fromJson(data);
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (context.mounted) {
        Common.showDioErrorDialog(context, e: e);
      }

    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }

    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
    return null;
  }

}