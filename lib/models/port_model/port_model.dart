class PortsModel {
  int? statusCode;
  String? message;
  String? error;
  List<PortData>? data;

  PortsModel({this.statusCode, this.message, this.error, this.data});

  PortsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = <PortData>[];
      json['data'].forEach((v) {
        data!.add(new PortData.fromJson(v));
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

class PortData {
  String? portId;
  String? postcode;
  String? portName;
  String? portType;

  PortData({this.portId, this.postcode, this.portName, this.portType});

  PortData.fromJson(Map<String, dynamic> json) {
    portId = json['port_id'];
    postcode = json['postcode'];
    portName = json['port_name'];
    portType = json['port_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['port_id'] = this.portId;
    data['postcode'] = this.postcode;
    data['port_name'] = this.portName;
    data['port_type'] = this.portType;
    return data;
  }
}
