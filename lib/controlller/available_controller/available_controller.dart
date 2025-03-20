import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jewels_airport_transfers/models/scheduled_journey_model/scheduled_journey_model.dart';
import '../../repositories/shared_pref_repo.dart';
import '../../services/api_services.dart';
import '../../utills/logging.dart';

class AvailableController extends GetxController {
  final scheduledJourneyJob = ScheduledJourneyModel().obs;
  final scheduledJourneyJobList = <ScheduledJourneyModel>[].obs;

  RxBool isAvailableLoading = true.obs;
  final isLoading = false.obs;
  final driverId = ''.obs;
  final bookingJourneyId = ''.obs;
  final isAccepting = false.obs;

  final SharedPrefsRepository repository = SharedPrefsRepository();
  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    scheduledJourneyDetails(Get.context!);
  }

  final scheduledJourneyModel = ScheduledJourneyModel().obs;

  scheduledJourneyDetails(BuildContext context) async {
    try {
      isAvailableLoading.value = true;
      var res = await _apiService.scheduledJourneyDetailsApi(context);
      if (res != null) {
        scheduledJourneyJob.value = res;
        update();
      }
    } catch (e) {
      Logger.error("API Error: ${e.toString()}");
    } finally {
      isAvailableLoading.value = false;
    }
  }

  confirmAvailability(BuildContext context) async {
    try {
      EasyLoading.show(
          status: "Updating...", maskType: EasyLoadingMaskType.clear);

      Map<String, dynamic> body = {
        'driver_id': repository.driverId.toString(),
        'booking_journey_id': repository.bookingJourneyId.toString(),
        'status': isAccepting.value ? "1" : "0",
      };

      final response = await _apiService.confirmAvailablityApi(context, body);
      if (response != null) {
        Logger.success("Response: $response");

        // Reset values after API call
        driverId.value = '';
        bookingJourneyId.value = '';
        isAccepting.value = false;
        scheduledJourneyDetails(Get.context!);
        update();
      }
    } catch (e) {
      Logger.error("API Error: ${e.toString()}");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
