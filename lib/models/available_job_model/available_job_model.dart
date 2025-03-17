class AvailableJobModel {
  int? statusCode;
  String? message;
  String? error;
  List<Data>? data;

  AvailableJobModel({this.statusCode, this.message, this.error, this.data});

  AvailableJobModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? bookingJourneyId;
  String? bookingId;
  String? bookingSubId;
  String? bookingBidRef;
  String? bookingType;
  String? portType;
  String? portId;
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
  String? name;
  String? mobileCode;
  String? mobile;
  String? email;
  String? passengers;
  String? luggage;
  String? flightNo;
  String? arriveFrom;
  String? remarks;
  String? driverSupplierRemarks;
  String? arrivalDateTime;
  String? meetGreet;
  String? meetGreetFare;
  String? fare;
  String? actualFare;
  String? dateCreated;
  String? dateModified;
  String? pickupDate;
  String? driverId;
  String? payment;
  String? paymentStatus;
  String? paymentType;
  String? quoteId;
  String? distance;
  String? duration;
  String? quoteNotifyStatus;
  String? quoteDeleted;
  String? quoteConvertedAt;
  String? bookingRefId;
  String? updateForBooking;
  String? reasonForCancellation;
  String? amendRequest;
  String? amendNotifyStatus;
  String? amendRequestAt;
  String? purchaseNo;
  String? overridePrice;
  String? overridePriceText;
  String? poamount;
  String? originalFare;
  String? fareDiff;
  String? incorrectdetailComment;
  String? isBid;
  String? iconStatus;
  String? version;
  String? ferryStatus;
  String? newFlag;
  String? adminId;
  String? voucherId;
  String? vouchercode;
  String? discount;
  String? adminAmendcomments;
  String? amtRefunded;
  String? cancelDate;
  String? isRebid;
  String? rebidDatetime;
  String? mapdriverComment;
  String? driverStatus;
  String? isExpire;
  String? expireDate;
  String? isAmountToBeRefunded;
  String? isNewBasket;
  String? voidStatus;
  String? settleStatus;
  String? minorCharge;
  String? updatedFare;
  String? updatedFareComments;
  String? creditPaymentStatus;
  String? oldDriverId;
  String? manualDatetime;
  String? isBidExpire;
  String? autobidTime;

  Data(
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
      this.waypointPostcode,
      this.name,
      this.mobileCode,
      this.mobile,
      this.email,
      this.passengers,
      this.luggage,
      this.flightNo,
      this.arriveFrom,
      this.remarks,
      this.driverSupplierRemarks,
      this.arrivalDateTime,
      this.meetGreet,
      this.meetGreetFare,
      this.fare,
      this.actualFare,
      this.dateCreated,
      this.dateModified,
      this.pickupDate,
      this.driverId,
      this.payment,
      this.paymentStatus,
      this.paymentType,
      this.quoteId,
      this.distance,
      this.duration,
      this.quoteNotifyStatus,
      this.quoteDeleted,
      this.quoteConvertedAt,
      this.bookingRefId,
      this.updateForBooking,
      this.reasonForCancellation,
      this.amendRequest,
      this.amendNotifyStatus,
      this.amendRequestAt,
      this.purchaseNo,
      this.overridePrice,
      this.overridePriceText,
      this.poamount,
      this.originalFare,
      this.fareDiff,
      this.incorrectdetailComment,
      this.isBid,
      this.iconStatus,
      this.version,
      this.ferryStatus,
      this.newFlag,
      this.adminId,
      this.voucherId,
      this.vouchercode,
      this.discount,
      this.adminAmendcomments,
      this.amtRefunded,
      this.cancelDate,
      this.isRebid,
      this.rebidDatetime,
      this.mapdriverComment,
      this.driverStatus,
      this.isExpire,
      this.expireDate,
      this.isAmountToBeRefunded,
      this.isNewBasket,
      this.voidStatus,
      this.settleStatus,
      this.minorCharge,
      this.updatedFare,
      this.updatedFareComments,
      this.creditPaymentStatus,
      this.oldDriverId,
      this.manualDatetime,
      this.isBidExpire,
      this.autobidTime});

  Data.fromJson(Map<String, dynamic> json) {
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
    name = json['name'];
    mobileCode = json['mobile_code'];
    mobile = json['mobile'];
    email = json['email'];
    passengers = json['passengers'];
    luggage = json['luggage'];
    flightNo = json['flight_no'];
    arriveFrom = json['arrive_from'];
    remarks = json['remarks'];
    driverSupplierRemarks = json['driver_supplier_remarks'];
    arrivalDateTime = json['arrival_date_time'];
    meetGreet = json['meet_greet'];
    meetGreetFare = json['meet_greet_fare'];
    fare = json['fare'];
    actualFare = json['actual_fare'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    pickupDate = json['pickup_date'];
    driverId = json['driver_id'];
    payment = json['payment'];
    paymentStatus = json['payment_status'];
    paymentType = json['payment_type'];
    quoteId = json['quote_id'];
    distance = json['distance'];
    duration = json['duration'];
    quoteNotifyStatus = json['quote_notify_status'];
    quoteDeleted = json['quote_deleted'];
    quoteConvertedAt = json['quote_converted_at'];
    bookingRefId = json['booking_ref_id'];
    updateForBooking = json['update_for_booking'];
    reasonForCancellation = json['reason_for_cancellation'];
    amendRequest = json['amend_request'];
    amendNotifyStatus = json['amend_notify_status'];
    amendRequestAt = json['amend_request_at'];
    purchaseNo = json['purchase_no'];
    overridePrice = json['override_price'];
    overridePriceText = json['override_price_text'];
    poamount = json['poamount'];
    originalFare = json['original_fare'];
    fareDiff = json['fare_diff'];
    incorrectdetailComment = json['incorrectdetail_comment'];
    isBid = json['is_bid'];
    iconStatus = json['icon_status'];
    version = json['version'];
    ferryStatus = json['ferry_status'];
    newFlag = json['new_flag'];
    adminId = json['admin_id'];
    voucherId = json['voucher_id'];
    vouchercode = json['vouchercode'];
    discount = json['discount'];
    adminAmendcomments = json['admin_amendcomments'];
    amtRefunded = json['amt_refunded'];
    cancelDate = json['cancel_date'];
    isRebid = json['is_rebid'];
    rebidDatetime = json['rebid_datetime'];
    mapdriverComment = json['mapdriver_comment'];
    driverStatus = json['driver_status'];
    isExpire = json['is_expire'];
    expireDate = json['expire_date'];
    isAmountToBeRefunded = json['is_amount_to_be_refunded'];
    isNewBasket = json['is_new_basket'];
    voidStatus = json['void_status'];
    settleStatus = json['settle_status'];
    minorCharge = json['minor_charge'];
    updatedFare = json['updated_fare'];
    updatedFareComments = json['updated_fare_comments'];
    creditPaymentStatus = json['credit_payment_status'];
    oldDriverId = json['old_driver_id'];
    manualDatetime = json['manual_datetime'];
    isBidExpire = json['is_bid_expire'];
    autobidTime = json['autobid_time'];
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
    data['name'] = this.name;
    data['mobile_code'] = this.mobileCode;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['passengers'] = this.passengers;
    data['luggage'] = this.luggage;
    data['flight_no'] = this.flightNo;
    data['arrive_from'] = this.arriveFrom;
    data['remarks'] = this.remarks;
    data['driver_supplier_remarks'] = this.driverSupplierRemarks;
    data['arrival_date_time'] = this.arrivalDateTime;
    data['meet_greet'] = this.meetGreet;
    data['meet_greet_fare'] = this.meetGreetFare;
    data['fare'] = this.fare;
    data['actual_fare'] = this.actualFare;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['pickup_date'] = this.pickupDate;
    data['driver_id'] = this.driverId;
    data['payment'] = this.payment;
    data['payment_status'] = this.paymentStatus;
    data['payment_type'] = this.paymentType;
    data['quote_id'] = this.quoteId;
    data['distance'] = this.distance;
    data['duration'] = this.duration;
    data['quote_notify_status'] = this.quoteNotifyStatus;
    data['quote_deleted'] = this.quoteDeleted;
    data['quote_converted_at'] = this.quoteConvertedAt;
    data['booking_ref_id'] = this.bookingRefId;
    data['update_for_booking'] = this.updateForBooking;
    data['reason_for_cancellation'] = this.reasonForCancellation;
    data['amend_request'] = this.amendRequest;
    data['amend_notify_status'] = this.amendNotifyStatus;
    data['amend_request_at'] = this.amendRequestAt;
    data['purchase_no'] = this.purchaseNo;
    data['override_price'] = this.overridePrice;
    data['override_price_text'] = this.overridePriceText;
    data['poamount'] = this.poamount;
    data['original_fare'] = this.originalFare;
    data['fare_diff'] = this.fareDiff;
    data['incorrectdetail_comment'] = this.incorrectdetailComment;
    data['is_bid'] = this.isBid;
    data['icon_status'] = this.iconStatus;
    data['version'] = this.version;
    data['ferry_status'] = this.ferryStatus;
    data['new_flag'] = this.newFlag;
    data['admin_id'] = this.adminId;
    data['voucher_id'] = this.voucherId;
    data['vouchercode'] = this.vouchercode;
    data['discount'] = this.discount;
    data['admin_amendcomments'] = this.adminAmendcomments;
    data['amt_refunded'] = this.amtRefunded;
    data['cancel_date'] = this.cancelDate;
    data['is_rebid'] = this.isRebid;
    data['rebid_datetime'] = this.rebidDatetime;
    data['mapdriver_comment'] = this.mapdriverComment;
    data['driver_status'] = this.driverStatus;
    data['is_expire'] = this.isExpire;
    data['expire_date'] = this.expireDate;
    data['is_amount_to_be_refunded'] = this.isAmountToBeRefunded;
    data['is_new_basket'] = this.isNewBasket;
    data['void_status'] = this.voidStatus;
    data['settle_status'] = this.settleStatus;
    data['minor_charge'] = this.minorCharge;
    data['updated_fare'] = this.updatedFare;
    data['updated_fare_comments'] = this.updatedFareComments;
    data['credit_payment_status'] = this.creditPaymentStatus;
    data['old_driver_id'] = this.oldDriverId;
    data['manual_datetime'] = this.manualDatetime;
    data['is_bid_expire'] = this.isBidExpire;
    data['autobid_time'] = this.autobidTime;
    return data;
  }
}
