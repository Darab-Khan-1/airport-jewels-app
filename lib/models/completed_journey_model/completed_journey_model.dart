class CompletedJourneyModel {
  int? statusCode;
  String? message;
  String? error;
  List<CompletedData>? data;

  CompletedJourneyModel({this.statusCode, this.message, this.error, this.data});

  CompletedJourneyModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = <CompletedData>[];
      json['data'].forEach((v) {
        data!.add(new CompletedData.fromJson(v));
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

class CompletedData {
  String? bookingJourneyId;
  String? bookingId;
  String? bookingSubId;
  String? bookingBidRef;
  String? bookingType;
  String? portType;
  Null? portId;
  String? carId;
  String? status;
  String? visibility;
  String? resendPaymentLink;
  String? isActive;
  String? userId;
  String? journeyType;
  String? fromAddress;
  String? toAddress;
  String? fromPostcode;
  String? toPostcode;
  String? waypoint;
  String? waypointPostcode;

  CompletedData(
      {this.bookingJourneyId,
      this.bookingId,
      this.bookingSubId,
      this.bookingBidRef,
      this.bookingType,
      this.portType,
      this.portId,
      this.carId,
      this.status,
      this.visibility,
      this.resendPaymentLink,
      this.isActive,
      this.userId,
      this.journeyType,
      this.fromAddress,
      this.toAddress,
      this.fromPostcode,
      this.toPostcode,
      this.waypoint,
      this.waypointPostcode});

  CompletedData.fromJson(Map<String, dynamic> json) {
    bookingJourneyId = json['booking_journey_id'];
    bookingId = json['booking_id'];
    bookingSubId = json['booking_sub_id'];
    bookingBidRef = json['booking_bid_ref'];
    bookingType = json['booking_type'];
    portType = json['port_type'];
    portId = json['port_id'];
    carId = json['car_id'];
    status = json['status'];
    visibility = json['visibility'];
    resendPaymentLink = json['resend_payment_link'];
    isActive = json['is_active'];
    userId = json['user_id'];
    journeyType = json['journey_type'];
    fromAddress = json['from_address'];
    toAddress = json['to_address'];
    fromPostcode = json['from_postcode'];
    toPostcode = json['to_postcode'];
    waypoint = json['waypoint'];
    waypointPostcode = json['waypoint_postcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_journey_id'] = this.bookingJourneyId;
    data['booking_id'] = this.bookingId;
    data['booking_sub_id'] = this.bookingSubId;
    data['booking_bid_ref'] = this.bookingBidRef;
    data['booking_type'] = this.bookingType;
    data['port_type'] = this.portType;
    data['port_id'] = this.portId;
    data['car_id'] = this.carId;
    data['status'] = this.status;
    data['visibility'] = this.visibility;
    data['resend_payment_link'] = this.resendPaymentLink;
    data['is_active'] = this.isActive;
    data['user_id'] = this.userId;
    data['journey_type'] = this.journeyType;
    data['from_address'] = this.fromAddress;
    data['to_address'] = this.toAddress;
    data['from_postcode'] = this.fromPostcode;
    data['to_postcode'] = this.toPostcode;
    data['waypoint'] = this.waypoint;
    data['waypoint_postcode'] = this.waypointPostcode;
    return data;
  }
}
