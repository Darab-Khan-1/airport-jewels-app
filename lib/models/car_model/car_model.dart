class CarsModel {
  int? statusCode;
  String? message;
  String? error;
  List<CarData>? data;

  CarsModel({this.statusCode, this.message, this.error, this.data});

  CarsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = <CarData>[];
      json['data'].forEach((v) {
        data!.add(new CarData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CarData {
  String? carId;
  String? carName;
  bool? isSelected;

  CarData({this.carId, this.carName, this.isSelected = false});

  CarData.fromJson(Map<String, dynamic> json) {
    carId = json['car_id'];
    carName = json['car_name'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['car_id'] = this.carId;
    data['car_name'] = this.carName;
    return data;
  }
}
