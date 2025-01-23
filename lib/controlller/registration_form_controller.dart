import 'package:get/get.dart';

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
