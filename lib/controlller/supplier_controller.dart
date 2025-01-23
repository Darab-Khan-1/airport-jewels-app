import 'package:get/get.dart';

class SupplierController extends GetxController {
  var isChecked = false.obs;
  String selectedCountryCode = "+92";

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }
}
