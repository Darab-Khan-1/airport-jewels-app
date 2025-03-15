import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/constants/enum.dart';
import 'package:jewels_airport_transfers/constants/global.dart';
import 'package:jewels_airport_transfers/models/car_model/car_model.dart';
import 'package:jewels_airport_transfers/repositories/shared_pref_repo.dart';
import 'package:jewels_airport_transfers/screens/supplier/supplier_home_screen.dart';
import 'package:jewels_airport_transfers/services/api_services.dart';
import 'package:jewels_airport_transfers/utills/logging.dart';

class AuthController extends GetxController {
  var keepMeLogin = false.obs;
  String selectedCountryCode = "+92";

  void toggleCheckbox() {
    keepMeLogin.value = !keepMeLogin.value;
  }
  RxString selectedOption = "Email".obs;

  Rx<UserRole> role = UserRole.UNKNOWN.obs;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  SharedPrefsRepository repository = SharedPrefsRepository();

  final allCars = CarsModel().obs;

  login(BuildContext context) async{
    try{

      Map<String,dynamic> body = {
        "username" : emailController.value.text.trim(),
        "password" : passwordController.value.text.trim()
      };
      var res = await ApiService().loginApi(context, body);
      if( res != null){
        await repository.saveLoginModel(res);
        Global().setUserRole(res.data?.userType ?? '');
        Get.offAll(const SupplierHomeScreen());
      }

    }catch(e) {
      Logger.error("Login Api Error:${e.toString()}");
    }
  }
  getAllCars(BuildContext context) async{
    try{
      var res = await ApiService().getAllCarsApi(context);
      if( res != null){
        allCars.value = res;
        update();
      }

    }catch(e) {
      Logger.error("Api Error:${e.toString()}");
    }
  }


}
