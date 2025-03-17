import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/models/all_driver_model/all_driver_model.dart';
import '../../repositories/shared_pref_repo.dart';
import '../../services/api_services.dart';
import '../../utills/logging.dart';

class JobController extends GetxController {
  final pushJob = AllDriverModel().obs;
  final pushJobList = <AllDriverModel>[].obs;
  final isLoading = false.obs;
  final selectedDriverIndex = RxInt(-1); // Added selected driver index
  final driverAmounts = <double>[].obs;
  SharedPrefsRepository repository = SharedPrefsRepository();
  // Select a driver by index
  void selectDriver(int index) {
    selectedDriverIndex.value = index;
    update();
  } // Added to store driver amounts

  @override
  void onInit() {
    super.onInit();
    getAllDrivers(Get.context!);
  }

  final allDriverModel = AllDriverModel().obs;

  getAllDrivers(BuildContext context) async {
    try {
      var res = await ApiService().getAllDriversApi(context);
      if (res != null) {
        allDriverModel.value = res;
        update();
      }
    } catch (e) {
      Logger.error("Api Error:${e.toString()}");
    }
  }
}
