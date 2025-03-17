class AllDriverModel {
  int? statusCode;
  String? message;
  String? error;
  List<Data>? data;

  AllDriverModel({this.statusCode, this.message, this.error, this.data});

  AllDriverModel.fromJson(Map<String, dynamic> json) {
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
  String? driverId;
  String? customerType;
  String? title;
  String? firstname;
  String? lastname;
  String? email;
  String? newsletterSubscribtion;
  String? password;
  String? passwordStatus;
  String? creditLimit;
  String? usedCreditLimit;
  String? makePayment;
  String? groupid;
  String? status;
  String? licenseNumber;
  String? licenseExpiryMm;
  String? licenseExpiryYy;
  String? nationalInsuranceNo;
  String? insuranceExpiryMm;
  String? insuranceExpiryYy;
  String? motExpiryMm;
  String? motExpiryYy;
  String? regNumber;
  String? make;
  String? model;
  String? badgeNumber;
  String? pcoExpiryMm;
  String? pcoExpiryYy;
  String? vehicleLicenseExpiryMm;
  String? vehicleLicenseExpiryYy;
  String? employmentStatus;
  String? commissionType;
  String? commission;
  String? visaType;
  String? visaExpiryMm;
  String? visaExpiryYy;
  String? creditStatus;
  String? address1;
  String? address2;
  String? country;
  String? cityId;
  String? townId;
  String? postcode;
  String? companyname;
  String? description;
  String? tel;
  String? mob;
  String? mob2;
  String? mob3;
  String? pcoBadgeNo;
  String? fax;
  String? registeredDate;
  String? lastLogin;
  String? activationcode;
  String? newsSubscription;
  String? emergencyCode;
  String? emergencyNumber;
  String? memStatus;
  String? memHide;
  String? hash;
  String? doj;
  String? dateLeft;
  String? companyCar;
  String? vehicle;
  String? quoteRequest;
  String? dob;
  String? driverImg;
  String? carReg;
  String? vColor;
  String? dlNumber;
  String? logBook;
  String? rentalAgreement;
  String? rentalexpiry;
  String? motexpiry;
  String? vpcoexpiry;
  String? pcocexpiry;
  String? badgeExpiry;
  String? insuranceexpiry;
  String? operatorlicexpiry;
  String? mot;
  String? vPco;
  String? vPcoNo;
  String? pcoCounter;
  String? badge;
  String? insurance;
  String? serviceArea;
  String? businessName;
  String? operatorLic;
  String? businessInsurance;
  String? businessNature;
  String? longBusiness;
  String? invoiceContact;
  String? mainContact;
  String? code1;
  String? code2;
  String? code3;
  String? rent;
  String? dlExpiry;
  String? driverstatus;
  String? address3;
  String? driverRent;
  String? businessExpiry;
  String? operatorExpiry;
  String? county;
  String? state;
  String? accountNo;
  String? accountName;
  String? bankName;
  String? sortCode;
  String? tradingname;
  String? invoicename;
  String? invoiceaddress1;
  String? invoiceaddress2;
  String? invoiceaddress3;
  String? chargename;
  String? generalCommission;
  String? generalFrequency;
  String? generalComsionType;
  String? corpinno;
  String? discountAmount;
  String? membersid;
  String? licenseimage;
  String? tradename;
  String? profileUpdate;
  String? sendPinEmail;
  String? licenseAut;
  String? supplierMutipleDocument;
  String? longitude;
  String? latitude;
  String? availStatus;
  String? availablePostcode;
  String? avatar;

  Data(
      {this.driverId,
      this.customerType,
      this.title,
      this.firstname,
      this.lastname,
      this.email,
      this.newsletterSubscribtion,
      this.password,
      this.passwordStatus,
      this.creditLimit,
      this.usedCreditLimit,
      this.makePayment,
      this.groupid,
      this.status,
      this.licenseNumber,
      this.licenseExpiryMm,
      this.licenseExpiryYy,
      this.nationalInsuranceNo,
      this.insuranceExpiryMm,
      this.insuranceExpiryYy,
      this.motExpiryMm,
      this.motExpiryYy,
      this.regNumber,
      this.make,
      this.model,
      this.badgeNumber,
      this.pcoExpiryMm,
      this.pcoExpiryYy,
      this.vehicleLicenseExpiryMm,
      this.vehicleLicenseExpiryYy,
      this.employmentStatus,
      this.commissionType,
      this.commission,
      this.visaType,
      this.visaExpiryMm,
      this.visaExpiryYy,
      this.creditStatus,
      this.address1,
      this.address2,
      this.country,
      this.cityId,
      this.townId,
      this.postcode,
      this.companyname,
      this.description,
      this.tel,
      this.mob,
      this.mob2,
      this.mob3,
      this.pcoBadgeNo,
      this.fax,
      this.registeredDate,
      this.lastLogin,
      this.activationcode,
      this.newsSubscription,
      this.emergencyCode,
      this.emergencyNumber,
      this.memStatus,
      this.memHide,
      this.hash,
      this.doj,
      this.dateLeft,
      this.companyCar,
      this.vehicle,
      this.quoteRequest,
      this.dob,
      this.driverImg,
      this.carReg,
      this.vColor,
      this.dlNumber,
      this.logBook,
      this.rentalAgreement,
      this.rentalexpiry,
      this.motexpiry,
      this.vpcoexpiry,
      this.pcocexpiry,
      this.badgeExpiry,
      this.insuranceexpiry,
      this.operatorlicexpiry,
      this.mot,
      this.vPco,
      this.vPcoNo,
      this.pcoCounter,
      this.badge,
      this.insurance,
      this.serviceArea,
      this.businessName,
      this.operatorLic,
      this.businessInsurance,
      this.businessNature,
      this.longBusiness,
      this.invoiceContact,
      this.mainContact,
      this.code1,
      this.code2,
      this.code3,
      this.rent,
      this.dlExpiry,
      this.driverstatus,
      this.address3,
      this.driverRent,
      this.businessExpiry,
      this.operatorExpiry,
      this.county,
      this.state,
      this.accountNo,
      this.accountName,
      this.bankName,
      this.sortCode,
      this.tradingname,
      this.invoicename,
      this.invoiceaddress1,
      this.invoiceaddress2,
      this.invoiceaddress3,
      this.chargename,
      this.generalCommission,
      this.generalFrequency,
      this.generalComsionType,
      this.corpinno,
      this.discountAmount,
      this.membersid,
      this.licenseimage,
      this.tradename,
      this.profileUpdate,
      this.sendPinEmail,
      this.licenseAut,
      this.supplierMutipleDocument,
      this.longitude,
      this.latitude,
      this.availStatus,
      this.availablePostcode,
      this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    driverId = json['driver_id'];
    customerType = json['customer_type'];
    title = json['title'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    newsletterSubscribtion = json['newsletter_subscribtion'];
    password = json['password'];
    passwordStatus = json['password_status'];
    creditLimit = json['credit_limit'];
    usedCreditLimit = json['used_credit_limit'];
    makePayment = json['make_payment'];
    groupid = json['groupid'];
    status = json['status'];
    licenseNumber = json['license_number'];
    licenseExpiryMm = json['license_expiry_mm'];
    licenseExpiryYy = json['license_expiry_yy'];
    nationalInsuranceNo = json['national_insurance_no'];
    insuranceExpiryMm = json['insurance_expiry_mm'];
    insuranceExpiryYy = json['insurance_expiry_yy'];
    motExpiryMm = json['mot_expiry_mm'];
    motExpiryYy = json['mot_expiry_yy'];
    regNumber = json['reg_number'];
    make = json['make'];
    model = json['model'];
    badgeNumber = json['badge_number'];
    pcoExpiryMm = json['pco_expiry_mm'];
    pcoExpiryYy = json['pco_expiry_yy'];
    vehicleLicenseExpiryMm = json['vehicle_license_expiry_mm'];
    vehicleLicenseExpiryYy = json['vehicle_license_expiry_yy'];
    employmentStatus = json['employment_status'];
    commissionType = json['commission_type'];
    commission = json['commission'];
    visaType = json['visa_type'];
    visaExpiryMm = json['visa_expiry_mm'];
    visaExpiryYy = json['visa_expiry_yy'];
    creditStatus = json['credit_status'];
    address1 = json['address1'];
    address2 = json['address2'];
    country = json['country'];
    cityId = json['city_id'];
    townId = json['town_id'];
    postcode = json['postcode'];
    companyname = json['companyname'];
    description = json['description'];
    tel = json['tel'];
    mob = json['mob'];
    mob2 = json['mob2'];
    mob3 = json['mob3'];
    pcoBadgeNo = json['pco_badge_no'];
    fax = json['fax'];
    registeredDate = json['registered_date'];
    lastLogin = json['last_login'];
    activationcode = json['activationcode'];
    newsSubscription = json['news_subscription'];
    emergencyCode = json['emergency_code'];
    emergencyNumber = json['emergency_number'];
    memStatus = json['mem_status'];
    memHide = json['mem_hide'];
    hash = json['hash'];
    doj = json['doj'];
    dateLeft = json['date_left'];
    companyCar = json['company_car'];
    vehicle = json['vehicle'];
    quoteRequest = json['quote_request'];
    dob = json['dob'];
    driverImg = json['driver_img'];
    carReg = json['car_reg'];
    vColor = json['v_color'];
    dlNumber = json['dl_number'];
    logBook = json['log_book'];
    rentalAgreement = json['rental_agreement'];
    rentalexpiry = json['rentalexpiry'];
    motexpiry = json['motexpiry'];
    vpcoexpiry = json['vpcoexpiry'];
    pcocexpiry = json['pcocexpiry'];
    badgeExpiry = json['badge_expiry'];
    insuranceexpiry = json['insuranceexpiry'];
    operatorlicexpiry = json['operatorlicexpiry'];
    mot = json['mot'];
    vPco = json['v_pco'];
    vPcoNo = json['v_pco_no'];
    pcoCounter = json['pco_counter'];
    badge = json['badge'];
    insurance = json['insurance'];
    serviceArea = json['service_area'];
    businessName = json['business_name'];
    operatorLic = json['operator_lic'];
    businessInsurance = json['business_insurance'];
    businessNature = json['business_nature'];
    longBusiness = json['long_business'];
    invoiceContact = json['invoice_contact'];
    mainContact = json['main_contact'];
    code1 = json['code1'];
    code2 = json['code2'];
    code3 = json['code3'];
    rent = json['rent'];
    dlExpiry = json['dl_expiry'];
    driverstatus = json['driverstatus'];
    address3 = json['address3'];
    driverRent = json['driver_rent'];
    businessExpiry = json['business_expiry'];
    operatorExpiry = json['operator_expiry'];
    county = json['county'];
    state = json['state'];
    accountNo = json['account_no'];
    accountName = json['account_name'];
    bankName = json['bank_name'];
    sortCode = json['sort_code'];
    tradingname = json['tradingname'];
    invoicename = json['invoicename'];
    invoiceaddress1 = json['invoiceaddress1'];
    invoiceaddress2 = json['invoiceaddress2'];
    invoiceaddress3 = json['invoiceaddress3'];
    chargename = json['chargename'];
    generalCommission = json['general_commission'];
    generalFrequency = json['general_frequency'];
    generalComsionType = json['general_comsion_type'];
    corpinno = json['corpinno'];
    discountAmount = json['discount_amount'];
    membersid = json['membersid'];
    licenseimage = json['licenseimage'];
    tradename = json['tradename'];
    profileUpdate = json['profile_update'];
    sendPinEmail = json['send_pin_email'];
    licenseAut = json['license_aut'];
    supplierMutipleDocument = json['supplier_mutiple_document'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    availStatus = json['avail_status'];
    availablePostcode = json['available_postcode'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driver_id'] = this.driverId;
    data['customer_type'] = this.customerType;
    data['title'] = this.title;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['newsletter_subscribtion'] = this.newsletterSubscribtion;
    data['password'] = this.password;
    data['password_status'] = this.passwordStatus;
    data['credit_limit'] = this.creditLimit;
    data['used_credit_limit'] = this.usedCreditLimit;
    data['make_payment'] = this.makePayment;
    data['groupid'] = this.groupid;
    data['status'] = this.status;
    data['license_number'] = this.licenseNumber;
    data['license_expiry_mm'] = this.licenseExpiryMm;
    data['license_expiry_yy'] = this.licenseExpiryYy;
    data['national_insurance_no'] = this.nationalInsuranceNo;
    data['insurance_expiry_mm'] = this.insuranceExpiryMm;
    data['insurance_expiry_yy'] = this.insuranceExpiryYy;
    data['mot_expiry_mm'] = this.motExpiryMm;
    data['mot_expiry_yy'] = this.motExpiryYy;
    data['reg_number'] = this.regNumber;
    data['make'] = this.make;
    data['model'] = this.model;
    data['badge_number'] = this.badgeNumber;
    data['pco_expiry_mm'] = this.pcoExpiryMm;
    data['pco_expiry_yy'] = this.pcoExpiryYy;
    data['vehicle_license_expiry_mm'] = this.vehicleLicenseExpiryMm;
    data['vehicle_license_expiry_yy'] = this.vehicleLicenseExpiryYy;
    data['employment_status'] = this.employmentStatus;
    data['commission_type'] = this.commissionType;
    data['commission'] = this.commission;
    data['visa_type'] = this.visaType;
    data['visa_expiry_mm'] = this.visaExpiryMm;
    data['visa_expiry_yy'] = this.visaExpiryYy;
    data['credit_status'] = this.creditStatus;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['country'] = this.country;
    data['city_id'] = this.cityId;
    data['town_id'] = this.townId;
    data['postcode'] = this.postcode;
    data['companyname'] = this.companyname;
    data['description'] = this.description;
    data['tel'] = this.tel;
    data['mob'] = this.mob;
    data['mob2'] = this.mob2;
    data['mob3'] = this.mob3;
    data['pco_badge_no'] = this.pcoBadgeNo;
    data['fax'] = this.fax;
    data['registered_date'] = this.registeredDate;
    data['last_login'] = this.lastLogin;
    data['activationcode'] = this.activationcode;
    data['news_subscription'] = this.newsSubscription;
    data['emergency_code'] = this.emergencyCode;
    data['emergency_number'] = this.emergencyNumber;
    data['mem_status'] = this.memStatus;
    data['mem_hide'] = this.memHide;
    data['hash'] = this.hash;
    data['doj'] = this.doj;
    data['date_left'] = this.dateLeft;
    data['company_car'] = this.companyCar;
    data['vehicle'] = this.vehicle;
    data['quote_request'] = this.quoteRequest;
    data['dob'] = this.dob;
    data['driver_img'] = this.driverImg;
    data['car_reg'] = this.carReg;
    data['v_color'] = this.vColor;
    data['dl_number'] = this.dlNumber;
    data['log_book'] = this.logBook;
    data['rental_agreement'] = this.rentalAgreement;
    data['rentalexpiry'] = this.rentalexpiry;
    data['motexpiry'] = this.motexpiry;
    data['vpcoexpiry'] = this.vpcoexpiry;
    data['pcocexpiry'] = this.pcocexpiry;
    data['badge_expiry'] = this.badgeExpiry;
    data['insuranceexpiry'] = this.insuranceexpiry;
    data['operatorlicexpiry'] = this.operatorlicexpiry;
    data['mot'] = this.mot;
    data['v_pco'] = this.vPco;
    data['v_pco_no'] = this.vPcoNo;
    data['pco_counter'] = this.pcoCounter;
    data['badge'] = this.badge;
    data['insurance'] = this.insurance;
    data['service_area'] = this.serviceArea;
    data['business_name'] = this.businessName;
    data['operator_lic'] = this.operatorLic;
    data['business_insurance'] = this.businessInsurance;
    data['business_nature'] = this.businessNature;
    data['long_business'] = this.longBusiness;
    data['invoice_contact'] = this.invoiceContact;
    data['main_contact'] = this.mainContact;
    data['code1'] = this.code1;
    data['code2'] = this.code2;
    data['code3'] = this.code3;
    data['rent'] = this.rent;
    data['dl_expiry'] = this.dlExpiry;
    data['driverstatus'] = this.driverstatus;
    data['address3'] = this.address3;
    data['driver_rent'] = this.driverRent;
    data['business_expiry'] = this.businessExpiry;
    data['operator_expiry'] = this.operatorExpiry;
    data['county'] = this.county;
    data['state'] = this.state;
    data['account_no'] = this.accountNo;
    data['account_name'] = this.accountName;
    data['bank_name'] = this.bankName;
    data['sort_code'] = this.sortCode;
    data['tradingname'] = this.tradingname;
    data['invoicename'] = this.invoicename;
    data['invoiceaddress1'] = this.invoiceaddress1;
    data['invoiceaddress2'] = this.invoiceaddress2;
    data['invoiceaddress3'] = this.invoiceaddress3;
    data['chargename'] = this.chargename;
    data['general_commission'] = this.generalCommission;
    data['general_frequency'] = this.generalFrequency;
    data['general_comsion_type'] = this.generalComsionType;
    data['corpinno'] = this.corpinno;
    data['discount_amount'] = this.discountAmount;
    data['membersid'] = this.membersid;
    data['licenseimage'] = this.licenseimage;
    data['tradename'] = this.tradename;
    data['profile_update'] = this.profileUpdate;
    data['send_pin_email'] = this.sendPinEmail;
    data['license_aut'] = this.licenseAut;
    data['supplier_mutiple_document'] = this.supplierMutipleDocument;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['avail_status'] = this.availStatus;
    data['available_postcode'] = this.availablePostcode;
    return data;
  }
}
