import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../models/available_job_model/available_job_model.dart';
import '../../repositories/shared_pref_repo.dart';
import '../../services/api_services.dart';
import '../../utills/logging.dart';

class QuotationController extends GetxController {
  final quotationJob = AvailableJobModel().obs;
  final quotationJobList = <AvailableJobModel>[].obs;

  RxBool isAvailableLoading = true.obs;
  final isLoading = false.obs;
  SharedPrefsRepository repository = SharedPrefsRepository();

  @override
  void onInit() {
    super.onInit();
    getAvailableJobs(Get.context!);
  }

  final availablelJobModel = AvailableJobModel().obs;

  getAvailableJobs(BuildContext context) async {
    try {
      isAvailableLoading.value = true;
      var res = await ApiService().getAvailableJobsApi(context);
      if (res != null) {
        availablelJobModel.value = res;
        update();
      }
    } catch (e) {
      Logger.error("Api Error:${e.toString()}");
    } finally {
      isAvailableLoading.value = false;
    }
  }
}
