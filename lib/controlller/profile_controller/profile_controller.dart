import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/profile_model/profile_model.dart';
import '../../repositories/network_client_repo.dart';
import '../../repositories/shared_pref_repo.dart';
import '../../services/api_services.dart';
import '../../utills/logging.dart';

class ProfileController extends GetxController {
  SharedPrefsRepository sharedPrefsRepository = SharedPrefsRepository();

  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final customerTypeController = TextEditingController().obs;
  RxString imagePath = ''.obs;
  RxBool isEdit = false.obs;

  final profileModel = ProfileModel().obs;

  setProfileData() {
    Data data = profileModel.value.data ?? Data();
    nameController.value.text =
        "${data.firstname ?? ""} ${data.lastname ?? ""}" ?? "";
    emailController.value.text = data.email ?? "";
    phoneController.value.text = data.mob ?? "";
    addressController.value.text = data.address1 ?? "";
    cityController.value.text = data.cityId ?? "";
    addressController.value.text = data.customerType ?? "";
    imagePath.value = data.driverImg ?? "";
    isEdit.value = true;
  }

  showProfile(BuildContext context) async {
    try {
      var res = await ApiService()
          .showProfileApi(context // Pass the user ID as the second parameter
              );
      if (res != null) {
        profileModel.value = res;
        update();
      }
    } catch (e) {
      Logger.error("Api Error:${e.toString()}");
    }
  }

  editUser(BuildContext context) async {
    try {
      var res = await ApiService()
          .editUserApi(context // Pass the user ID as the second parameter
              );
      if (res != null) {
        profileModel.value = res;
        update();
      }
    } catch (e) {
      Logger.error("Api Error:${e.toString()}");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    showProfile(Get.context!);
  }
}
