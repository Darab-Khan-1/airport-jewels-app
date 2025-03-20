class ScheduledJourneyModel {
  int? statusCode;
  String? message;
  String? error;
  List<ScheduledData>? data;

  ScheduledJourneyModel({this.statusCode, this.message, this.error, this.data});

  ScheduledJourneyModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = <ScheduledData>[];
      json['data'].forEach((v) {
        data!.add(ScheduledData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['message'] = message;
    data['error'] = error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScheduledData {
  String? id;
  String? driverId;
  String? bookingJourneyId;
  String? bookingBidRefId;
  String? bidingAmount;
  String? isCancel;
  dynamic comment;
  dynamic oldBid;
  String? dateCreated;
  String? dateModified;
  String? decline;
  String? confirmationDriver;
  String? availability;
  String? guidedprice;
  String? estimatedTime;

  ScheduledData({
    this.id,
    this.driverId,
    this.bookingJourneyId,
    this.bookingBidRefId,
    this.bidingAmount,
    this.isCancel,
    this.comment,
    this.oldBid,
    this.dateCreated,
    this.dateModified,
    this.decline,
    this.confirmationDriver,
    this.availability,
    this.guidedprice,
    this.estimatedTime,
  });

  ScheduledData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driver_id'];
    bookingJourneyId = json['booking_journey_id'];
    bookingBidRefId = json['booking_bid_ref_id'];
    bidingAmount = json['biding_amount'];
    isCancel = json['is_cancel'];
    comment = json['comment'];
    oldBid = json['old_bid'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    decline = json['decline'];
    confirmationDriver = json['confirmation_driver'];
    availability = json['availability'];
    guidedprice = json['guidedprice'];
    estimatedTime = json['estimated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['driver_id'] = driverId;
    data['booking_journey_id'] = bookingJourneyId;
    data['booking_bid_ref_id'] = bookingBidRefId;
    data['biding_amount'] = bidingAmount;
    data['is_cancel'] = isCancel;
    data['comment'] = comment;
    data['old_bid'] = oldBid;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    data['decline'] = decline;
    data['confirmation_driver'] = confirmationDriver;
    data['availability'] = availability;
    data['guidedprice'] = guidedprice;
    data['estimated_time'] = estimatedTime;
    return data;
  }
}
