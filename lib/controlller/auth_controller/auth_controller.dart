import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/constants/enum.dart';
import 'package:jewels_airport_transfers/constants/global.dart';
import 'package:jewels_airport_transfers/models/car_model/car_model.dart';
import 'package:jewels_airport_transfers/models/country_model/country_model.dart';
import 'package:jewels_airport_transfers/models/port_model/port_model.dart';
import 'package:jewels_airport_transfers/repositories/shared_pref_repo.dart';
import 'package:jewels_airport_transfers/screens/supplier/supplier_home_screen.dart';
import 'package:jewels_airport_transfers/screens/welcome_screen.dart';
import 'package:jewels_airport_transfers/services/api_services.dart';
import 'package:jewels_airport_transfers/utills/logging.dart';

import '../../constants/string.dart';

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var keepMeLogin = false.obs;
  String selectedCountryCode = "+92";
  final currentStep = 0.obs;
  late TabController tabController;

  void toggleCheckbox() {
    keepMeLogin.value = !keepMeLogin.value;
  }

  RxString selectedOption = "Email".obs;
  Rx<UserRole> role = UserRole.UNKNOWN.obs;
  RxnString selectedRole = RxnString(null);

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;
  final newPasswordConfirmController = TextEditingController().obs;

  SharedPrefsRepository repository = SharedPrefsRepository();

  final allCars = CarsModel().obs;
  final selectedCar = CarData().obs;
  final allCountries = AllCountryModel().obs;
  final allPorts = PortsModel().obs;

  List<String> selectedPorts = [];

  updateSelectedCar(CarData car) {
    selectedCar.value = car;
    allCars.value.data?.forEach((element) {
      if (element.carId == car.carId) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    });
    update();
  }

  final titleController = TextEditingController().obs;
  final memberTypeController = TextEditingController().obs;
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final statusController = TextEditingController().obs;
  final mobileNumberController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final postcodeController = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final availablePostcodeController = TextEditingController().obs;
  final vehicleController = TextEditingController().obs;
  final carRegController = TextEditingController().obs;
  final makeAndModelController = TextEditingController().obs;
  final companyCarController = TextEditingController().obs;
  final sortCodeController = TextEditingController().obs;
  final accountNumberController = TextEditingController().obs;
  final accountNameController = TextEditingController().obs;
  final bankNameController = TextEditingController().obs;

  login(BuildContext context) async {
    try {
      Map<String, dynamic> body = {
        "username": emailController.value.text.trim(),
        "password": passwordController.value.text.trim()
      };
      var res = await ApiService().loginApi(context, body);
      if (res != null) {
        await repository.saveLoginModel(res);
        Global().setUserRole(res.data?.userType ?? '');
        Get.offAll(SupplierHomeScreen());
      }
    } catch (e) {
      Logger.error("Login Api Error:${e.toString()}");
    }
  }

  getAllCars(BuildContext context) async {
    try {
      var res = await ApiService().getAllCarsApi(context);
      if (res != null) {
        allCars.value = res;
        update();
      }
    } catch (e) {
      Logger.error("Api Error:${e.toString()}");
    }
  }

  getAllCountries(BuildContext context) async {
    try {
      var res = await ApiService().getAllCountryApi(context);
      if (res != null) {
        allCountries.value = res;
        update();
      }
    } catch (e) {
      Logger.error("Api Error:${e.toString()}");
    }
  }

  getAllPorts(BuildContext context) async {
    try {
      var res = await ApiService().getAllPortsApi(context);
      if (res != null) {
        allPorts.value = res;
        update();
      }
    } catch (e) {
      Logger.error("Api Error:${e.toString()}");
    }
  }

  deleteUser(BuildContext context) async {
    try {
      var res = await ApiService().deleteUserApi(context);
      if (res != null) {
        Get.offAll(WelcomeScreen());
        update();
      }
    } catch (e) {
      Logger.error("Api Error:${e.toString()}");
    }
  }

  logout(BuildContext context) async {
    try {
      var res = await ApiService().logoutApi(context);
      if (res != null) {
        Get.offAll(WelcomeScreen());
        update();
      }
    } catch (e) {
      Logger.error("Api Error:${e.toString()}");
    }
  }

  updatePasssword(BuildContext context) async {
    try {
      Map<String, dynamic> body = {
        'old_password': passwordController.value.text.trim(),
        'new_password': newPasswordController.value.text.trim(),
      };

      var res = await ApiService().updatePasswordApi(context, body);
      if (res != null) {
        passwordController.value.clear();
        newPasswordController.value.clear();
        update();
      }
    } catch (e) {
      Logger.error("Api Error:${e.toString()}");
    }
  }

  registerUser(BuildContext context) async {
    try {
      Map<String, dynamic> body = {
        'title': titleController.value.text.trim(),
        'member_type': memberTypeController.value.text.trim(),
        'first_name': firstNameController.value.text.trim(),
        'last_name': lastNameController.value.text.trim(),
        'bussiness_name': titleController.value.text.trim(),
        'email': emailController.value.text.trim(),
        'password': passwordController.value.text.trim(),
        'mobile_number': mobileNumberController.value.text.trim(),
        'account_name': accountNameController.value.text.trim(),
        'account_number': accountNumberController.value.text.trim(),
        'sort_code': sortCodeController.value.text.trim(),
        'bank_name': bankNameController.value.text.trim(),
        "vehicle": "vehicle",
      };

      var res = await ApiService().registerUserApi(context, body);
      if (res != null) {
        titleController.value.clear();
        memberTypeController.value.clear();
        firstNameController.value.clear();
        lastNameController.value.clear();
        titleController.value.clear();
        emailController.value.clear();
        passwordController.value.clear();
        mobileNumberController.value.clear();
        accountNameController.value.clear();
        accountNumberController.value.clear();
        sortCodeController.value.clear();
        bankNameController.value.clear();
        update();
      }
    } catch (e) {
      Logger.error("Api Error:${e.toString()}");
    }
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

  void updateSelectedOption(String newValue) {
    selectedOption.value = newValue; // ✅ Updating Value
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
