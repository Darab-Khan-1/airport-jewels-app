import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jewels_airport_transfers/repositories/shared_pref_repo.dart';
import 'package:jewels_airport_transfers/screens/welcome_screen.dart';
import 'constants/string.dart';
import 'constants/theme.dart';
import 'controlller/auth_controller/auth_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefsRepository.initialize();
  Get.put(AuthController());
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.clear
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: AppTheme.lightTheme(context),
      builder: EasyLoading.init(),
      home: WelcomeScreen(),
    );
  }
}
