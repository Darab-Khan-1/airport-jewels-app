import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jewels_airport_transfers/models/all_driver_model/all_driver_model.dart';
import 'package:jewels_airport_transfers/models/car_model/car_model.dart';
import 'package:jewels_airport_transfers/models/comment_insert_model/comment_insert_model.dart';
import 'package:jewels_airport_transfers/models/country_model/country_model.dart';
import 'package:jewels_airport_transfers/models/login_model/login_model.dart';
import 'package:jewels_airport_transfers/models/port_model/port_model.dart';
import 'package:jewels_airport_transfers/models/profile_model/profile_model.dart';
import '../constants/common.dart';
import '../models/available_job_model/available_job_model.dart';
import '../repositories/apis.dart';
import '../repositories/network_client_repo.dart';
import '../repositories/shared_pref_repo.dart';
import '../utills/logging.dart';

class ApiService {
  SharedPrefsRepository sharedPrefsRepository = SharedPrefsRepository();
  final _requestClient = RequestClient(
    sharedPrefsRepository: SharedPrefsRepository(),
  );

  Future<LoginModel?> loginApi(
      BuildContext context, Map<String, dynamic> request) async {
    try {
      // Show loading indicator
      EasyLoading.show(
          status: "Logging in...",
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false);

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

  Future<CarsModel?> getAllCarsApi(
    BuildContext context,
  ) async {
    try {
      // Show loading indicator
      EasyLoading.show(
          status: "loading...",
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false);

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

  Future<AllCountryModel?> getAllCountryApi(
    BuildContext context,
  ) async {
    try {
      // Show loading indicator
      EasyLoading.show(
          status: "Loading...",
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false);

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

  Future<PortsModel?> getAllPortsApi(
    BuildContext context,
  ) async {
    try {
      // Show loading indicator
      EasyLoading.show(
          status: "Loading...",
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false);

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

  Future<AllDriverModel?> getAllDriversApi(
    BuildContext context,
  ) async {
    try {
      // Show loading indicator
      EasyLoading.show(
          status: "Loading...",
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false);

      // Make the API request
      final response = await _requestClient.request(
        url: AppUrl.getAllDrivers,
        method: RequestType.get,
      );

      // Handle the response
      final data = response.data;
      Logger.success(data.toString());
      return AllDriverModel.fromJson(data);
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (context.mounted) {
        Common.showDioErrorDialog(context, e: e);
      }
      return null;
    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }
      return null;
    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
  }

  Future<AvailableJobModel?> getAvailableJobsApi(
    BuildContext context,
  ) async {
    try {
      // Show loading indicator
      EasyLoading.show(
          status: "Loading...",
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false);

      // Make the API request
      final response = await _requestClient.request(
        url: "${AppUrl.availableJobs}/${sharedPrefsRepository.driverId}",
        method: RequestType.get,
      );

      // Handle the response
      final data = response.data;
      Logger.success(data.toString());
      return AvailableJobModel.fromJson(data);
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (context.mounted) {
        Common.showDioErrorDialog(context, e: e);
      }
      return null;
    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }
      return null;
    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
  }

  Future<dynamic> deleteUserApi(BuildContext context) async {
    try {
      EasyLoading.show(
          status: 'loading',
          dismissOnTap: false,
          maskType: EasyLoadingMaskType.black);

      final response = await _requestClient.request(
          url: "${AppUrl.deleteUser}/${sharedPrefsRepository.driverId}",
          method: RequestType.post);

      // Handle the response
      final data = response.data;
      Logger.success(data.toString());
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (context.mounted) {
        Common.showDioErrorDialog(context, e: e);
      }
      return null;
    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }
      return null;
    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
  }

  Future<ProfileModel?> showProfileApi(BuildContext context) async {
    try {
      EasyLoading.show(
          status: 'loading',
          dismissOnTap: false,
          maskType: EasyLoadingMaskType.black);

      final response = await _requestClient.request(
          url: "${AppUrl.showProfile}/${sharedPrefsRepository.driverId}",
          method: RequestType.get);

      // Handle the response
      final data = response.data;
      Logger.success(data.toString());
      return ProfileModel.fromJson(data);
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (context.mounted) {
        Common.showDioErrorDialog(context, e: e);
      }
      return null;
    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }
      return null;
    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
  }

  Future<ProfileModel?> editUserApi(BuildContext context) async {
    try {
      EasyLoading.show(
          status: 'loading',
          dismissOnTap: false,
          maskType: EasyLoadingMaskType.black);

      final response = await _requestClient.request(
          url: "${AppUrl.editUser}/${sharedPrefsRepository.driverId}",
          method: RequestType.post);

      // Handle the response
      final data = response.data;
      Logger.success(data.toString());
      return ProfileModel.fromJson(data);
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (context.mounted) {
        Common.showDioErrorDialog(context, e: e);
      }
      return null;
    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }
      return null;
    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
  }

  Future<dynamic> updatePasswordApi(
      BuildContext context, Map<String, dynamic> request) async {
    try {
      EasyLoading.show(
          status: "updating...", maskType: EasyLoadingMaskType.clear);

      final response = await _requestClient.request(
          url: "${AppUrl.updatePassword}/${sharedPrefsRepository.driverId}",
          method: RequestType.post,
          body: request);
      final data = response.data;
      Logger.success(data.toString());
      return data;
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (context.mounted) {
        Common.showDioErrorDialog(context, e: e);
      }
      return null;
    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }
      return null;
    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
  }

  Future<dynamic> addDriverApi(
      BuildContext context, Map<String, dynamic> request) async {
    try {
      EasyLoading.show(
          status: "updating...", maskType: EasyLoadingMaskType.clear);

      final response = await _requestClient.request(
          url: "${AppUrl.addDriver}/${sharedPrefsRepository.driverId}",
          method: RequestType.post,
          body: request);
      final data = response.data;
      Logger.success(data.toString());
      return data;
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (context.mounted) {
        Common.showDioErrorDialog(context, e: e);
      }
      return null;
    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }
      return null;
    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
  }

  Future<dynamic> logoutApi(BuildContext context) async {
    try {
      EasyLoading.show(
          status: 'Logging out..',
          dismissOnTap: false,
          maskType: EasyLoadingMaskType.black);

      // Make the API request
      final response = await _requestClient.request(
        url: "${AppUrl.logout}/${sharedPrefsRepository.driverId}",
        method: RequestType.get,
      );

      // Handle the response
      final data = response.data;
      Logger.success(data.toString());
      return data;
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (context.mounted) {
        Common.showDioErrorDialog(context, e: e);
      }
      return null;
    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }
      return null;
    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
  }

  Future<CommentInsertModel?> commentInsertApi(
    BuildContext context,
  ) async {
    try {
      // Show loading indicator
      EasyLoading.show(
          status: "Loading...",
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false);

      // Make the API request
      final response = await _requestClient.request(
        url: "${AppUrl.commentInsert}/${sharedPrefsRepository.driverId}",
        method: RequestType.post,
      );

      // Handle the response
      final data = response.data;
      Logger.success(data.toString());
      return CommentInsertModel.fromJson(data);
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (context.mounted) {
        Common.showDioErrorDialog(context, e: e);
      }
      return null;
    } catch (error) {
      // Handle any other exceptions
      Logger.error(error.toString());
      if (context.mounted) {
        Common.showErrorDialog(context,
            e: "An error occurred: ${error.toString()}");
      }
      return null;
    } finally {
      // Dismiss loading indicator
      EasyLoading.dismiss();
    }
  }
}
