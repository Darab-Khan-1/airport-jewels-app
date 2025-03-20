class LoginModel {
  int? statusCode;
  String? message;
  String? error;
  Data? data;

  LoginModel({this.statusCode, this.message, this.error, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userType;
  String? driverId;
  String? email;
  String? name;
  bool? loggedIn;
  String? token;
  String? bookingJourneyId;

  Data(
      {this.userType,
      this.driverId,
      this.email,
      this.name,
      this.loggedIn,
      this.token,
      this.bookingJourneyId});

  Data.fromJson(Map<String, dynamic> json) {
    userType = json['user_type'];
    driverId = json['driver_id'];
    email = json['email'];
    name = json['name'];
    loggedIn = json['logged_in'];
    token = json['token'];
    bookingJourneyId = json['booking_journey_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_type'] = this.userType;
    data['driver_id'] = this.driverId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['logged_in'] = this.loggedIn;
    data['token'] = this.token;
    data['booking_journey_id'] = this.bookingJourneyId;
    return data;
  }
}
