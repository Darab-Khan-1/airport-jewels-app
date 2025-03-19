import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../repositories/shared_pref_repo.dart';
import '../../services/api_services.dart';
import '../../utills/logging.dart';

class AddDriverController extends GetxController {
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final mobileController = TextEditingController().obs;
  final driverId = ''.obs;

  SharedPrefsRepository repository = SharedPrefsRepository();

  addDriver(BuildContext context) async {
    try {
      Map<String, dynamic> body = {
        'first_name': firstNameController.value.text.trim(),
        'last_name': lastNameController.value.text.trim(),
        'email': emailController.value.text.trim(),
        'mobile_number': mobileController.value.text.trim(),
        'supplier_id': repository.driverId.toString(),
      };

      var res = await ApiService().addDriverApi(context, body);
      if (res != null) {
        firstNameController.value.clear();
        lastNameController.value.clear();
        emailController.value.clear();
        mobileController.value.clear();
        driverId.value = '';
        update();
      }
    } catch (e) {
      Logger.error("Api Error: ${e.toString()}");
    }
  }
}
