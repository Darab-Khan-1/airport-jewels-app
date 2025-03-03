import 'package:jewels_airport_transfers/constants/enum.dart';

class Global {
  String? fcmToken;
  UserRole userRole = UserRole.UNKNOWN;
  static final Global _singleton = Global._internal();
  factory Global() {
    return _singleton;
  }
  Global._internal();
  void setFcmToken(String token) {
    fcmToken = token;
  }

  void setUserRole(String type){

    if(type == UserRole.DRIVER.name){
      userRole = UserRole.DRIVER;
    } else if(type == UserRole.SUPPLIER.name){
      userRole = UserRole.SUPPLIER;
    }else{
      userRole = UserRole.UNKNOWN;
    }
  }

}
