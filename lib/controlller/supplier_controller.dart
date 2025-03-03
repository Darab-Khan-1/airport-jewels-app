import 'package:get/get.dart';

class SupplierController extends GetxController {
  var keepMeLogin = false.obs;
  String selectedCountryCode = "+92";

  void toggleCheckbox() {
    keepMeLogin.value = !keepMeLogin.value;
  }
  RxString selectedOption = "Email".obs;
}
