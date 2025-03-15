import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/constants/extension.dart';
import 'package:jewels_airport_transfers/screens/welcome_screen.dart';
import '../repositories/shared_pref_repo.dart';
import '../utills/logging.dart';

class Common {
  static String capitalize(String s) {
    if (s.isEmpty) {
      return s;
    }

    List<String> words = s.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] =
            words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      }
    }

    return words.join(' ');
  }

  static void showDioErrorDialog(BuildContext context,
      {required DioException e}) {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: const Text('Oops!'),
        content: Text(getErrorMsgOfDio(e)),
        actions: <Widget>[
          SizedBox(
            width: context.screenWidth * 0.3,
            child: FilledButton(
              onPressed: () => Get.back(),
              child: Text("Got it"),
            ),
          ),
        ],
      ),
    );
  }

  static void showErrorDialog(BuildContext context, {required String e}) {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: const Text('Oops!'),
        content: Text(e),
        actions: <Widget>[
          FilledButton(
            onPressed: () => Get.back(),
            child: Text("Got it"),
          ),
        ],
      ),
    );
  }

  static String getErrorMsgOfDio(DioException e) {
    SharedPrefsRepository sharedPrefsRepository = SharedPrefsRepository();
    try {
      Logger.error(
          'Status Code: ${e.response?.statusCode}, Error: $e, Response: ${e.response?.data}');
      String errorMsg = 'Please, check your internet connection';
      if (e.response?.statusCode == 406) {
        errorMsg = '${e.response?.data}';
      } else if (e.response?.statusCode == 401) {
        errorMsg = 'Unauthorized';
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await sharedPrefsRepository.clearUserData();
          Get.offAll(() =>  WelcomeScreen());
        });
      } else if (e.response?.statusCode == 400) {
        if (e.response!.data['errors'] != null &&
            e.response!.data['errors'] != "") {
          errorMsg = handleDioException(e);
        }else if (e.response!.data['error'] != null &&
            e.response!.data['error'] != "") {
          errorMsg = e.response!.data['error'];
        } else if (e.response!.data['message'] != null) {
          errorMsg = e.response!.data['message'];
        }
      } else if (e.response?.statusCode == 404) {
        errorMsg = e.response!.data['message'];
      } else if (e.response != null && e.response!.data != null) {
        if (e.response?.data.runtimeType == String) {
          errorMsg = e.response!.data.toString();
        } else if (e.response?.data['message'] != null) {
          errorMsg = e.response!.data['message'].toString();
        } else if (e.response?.data['error'] != null) {
          errorMsg = e.response!.data['error'].toString();
        } else if (e.response!.data['title'] != null) {
          errorMsg = e.response!.data['title'].toString();
        } else {
          errorMsg = e.response!.data.toString();
        }
      } else if (e.message != null) {
        errorMsg = e.message!;
      }
      return errorMsg;
    } catch (e) {
      Logger.error('Errorexxx: $e');
      return 'Something went wrong';
    }
  }

  static String handleDioException(DioException e) {
    var errors = e.response?.data['errors'] ?? "Unknown error";
    List<String> errorslist = [];
    if (errors != null) {
      for (var key in errors.keys) {
        errorslist.add(errors[key][0]);
      }
    }
    return errorslist.join('\n').toString();
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    try {
      if (kDebugMode) {
        print('launching $launchUri');
      }
      // await launchUrl(launchUri);
    } catch (e) {
      if (kDebugMode) {
        print('Could not launch $launchUri: $e');
      }
    }
  }
}
