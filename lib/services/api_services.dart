import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jewels_airport_transfers/models/login_model/login_model.dart';

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

  Future<dynamic> loginApi(BuildContext context, Map<String, dynamic> request ) async {
    try {
      // Show loading indicator
      EasyLoading.show(
          status: "Logging in...", maskType: EasyLoadingMaskType.clear);

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
      return false;
    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }
      return false;
    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
  }

}