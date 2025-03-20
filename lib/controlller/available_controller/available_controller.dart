import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/models/scheduled_journey_model/scheduled_journey_model.dart';
import '../../repositories/shared_pref_repo.dart';
import '../../services/api_services.dart';
import '../../utills/logging.dart';

class AvailableController extends GetxController {
  final scheduledJourneyJob = ScheduledJourneyModel().obs;
  final scheduledJourneyJobList = <ScheduledJourneyModel>[].obs;

  RxBool isAvailableLoading = true.obs;
  final isLoading = false.obs;
  SharedPrefsRepository repository = SharedPrefsRepository();

  @override
  void onInit() {
    super.onInit();
    scheduledJourneyDetails(Get.context!);
  }

  final scheduledJourneyModel = ScheduledJourneyModel().obs;

  scheduledJourneyDetails(BuildContext context) async {
    try {
      isAvailableLoading.value = true;
      var res = await ApiService().scheduledJourneyDetailsApi(context);
      if (res != null) {
        scheduledJourneyJob.value = res;
        update();
      }
    } catch (e) {
      Logger.error("Api Error:${e.toString()}");
    } finally {
      isAvailableLoading.value = false;
    }
  }
}
