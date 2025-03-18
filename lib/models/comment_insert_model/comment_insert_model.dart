class CommentInsertModel {
  int? statusCode;
  String? message;
  String? error;
  List<Data>? data;

  CommentInsertModel({this.statusCode, this.message, this.error, this.data});

  CommentInsertModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? bookingJourneyId;
  String? loginId;
  Null? customerId;
  Null? driverId;
  String? comments;
  String? createdDate;
  String? status;
  String? pageStatus;
  String? showAmendSummary;
  String? adminLoginId;
  String? loginName;

  Data(
      {this.id,
      this.bookingJourneyId,
      this.loginId,
      this.customerId,
      this.driverId,
      this.comments,
      this.createdDate,
      this.status,
      this.pageStatus,
      this.showAmendSummary,
      this.adminLoginId,
      this.loginName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingJourneyId = json['booking_journey_id'];
    loginId = json['login_id'];
    customerId = json['customer_id'];
    driverId = json['driver_id'];
    comments = json['comments'];
    createdDate = json['created_date'];
    status = json['status'];
    pageStatus = json['page_status'];
    showAmendSummary = json['show_amend_summary'];
    adminLoginId = json['admin_login_id'];
    loginName = json['login_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_journey_id'] = this.bookingJourneyId;
    data['login_id'] = this.loginId;
    data['customer_id'] = this.customerId;
    data['driver_id'] = this.driverId;
    data['comments'] = this.comments;
    data['created_date'] = this.createdDate;
    data['status'] = this.status;
    data['page_status'] = this.pageStatus;
    data['show_amend_summary'] = this.showAmendSummary;
    data['admin_login_id'] = this.adminLoginId;
    data['login_name'] = this.loginName;
    return data;
  }
}
