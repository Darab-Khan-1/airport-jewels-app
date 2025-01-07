import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RegistrationFormController extends GetxController {
  final isChecked = false.obs;
  final currentStep = 0.obs;

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  void nextStep() {
    if (currentStep.value < 4) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }
}
