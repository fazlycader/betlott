/// page_title : "Profile Setting"
/// user : {"id":17,"name":"test9","email":"test9@gmail.com","mobile":null,"email_verified_at":null,"tfver":"0","emailv":"0","vercode":"0","balance":"0","gender":null,"address":null,"zip_code":null,"city":null,"country":null,"vsent":null,"secretcode":"0","tauth":"0","ref_id":null,"referral_token":"646f15082208d","status":"1","created_at":"2023-05-25T07:58:00.000000Z","updated_at":"2023-05-25T07:58:00.000000Z","image":null,"image_url":"https://bettpro.s7template.com/public/images/user-default.jpg"}
/// success : true

// ignore_for_file: dangling_library_doc_comments

class ProfileModel {
  ProfileModel({
    String? pageTitle,
    User? user,
    bool? success,
  }) {
    _pageTitle = pageTitle;
    _user = user;
    _success = success;
  }

  ProfileModel.fromJson(dynamic json) {
    _pageTitle = json['page_title'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _success = json['success'];
  }

  String? _pageTitle;
  User? _user;
  bool? _success;

  String? get pageTitle => _pageTitle;

  User? get user => _user;

  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page_title'] = _pageTitle;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['success'] = _success;
    return map;
  }
}

/// id : 17
/// name : "test9"
/// email : "test9@gmail.com"
/// mobile : null
/// email_verified_at : null
/// tfver : "0"
/// emailv : "0"
/// vercode : "0"
/// balance : "0"
/// gender : null
/// address : null
/// zip_code : null
/// city : null
/// country : null
/// vsent : null
/// secretcode : "0"
/// tauth : "0"
/// ref_id : null
/// referral_token : "646f15082208d"
/// status : "1"
/// created_at : "2023-05-25T07:58:00.000000Z"
/// updated_at : "2023-05-25T07:58:00.000000Z"
/// image : null
/// image_url : "https://bettpro.s7template.com/public/images/user-default.jpg"

class User {
  User({
    num? id,
    String? name,
    String? email,
    dynamic mobile,
    dynamic emailVerifiedAt,
    String? tfver,
    String? emailv,
    String? vercode,
    String? balance,
    dynamic gender,
    dynamic address,
    dynamic zipCode,
    dynamic city,
    dynamic country,
    dynamic vsent,
    String? secretcode,
    String? tauth,
    dynamic refId,
    String? referralToken,
    String? status,
    String? createdAt,
    String? updatedAt,
    dynamic image,
    String? imageUrl,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _mobile = mobile;
    _emailVerifiedAt = emailVerifiedAt;
    _tfver = tfver;
    _emailv = emailv;
    _vercode = vercode;
    _balance = balance;
    _gender = gender;
    _address = address;
    _zipCode = zipCode;
    _city = city;
    _country = country;
    _vsent = vsent;
    _secretcode = secretcode;
    _tauth = tauth;
    _refId = refId;
    _referralToken = referralToken;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _image = image;
    _imageUrl = imageUrl;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _emailVerifiedAt = json['email_verified_at'];
    _tfver = json['tfver'];
    _emailv = json['emailv'];
    _vercode = json['vercode'];
    _balance = json['balance'];
    _gender = json['gender'];
    _address = json['address'];
    _zipCode = json['zip_code'];
    _city = json['city'];
    _country = json['country'];
    _vsent = json['vsent'];
    _secretcode = json['secretcode'];
    _tauth = json['tauth'];
    _refId = json['ref_id'];
    _referralToken = json['referral_token'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _image = json['image'];
    _imageUrl = json['image_url'];
  }

  num? _id;
  String? _name;
  String? _email;
  dynamic _mobile;
  dynamic _emailVerifiedAt;
  String? _tfver;
  String? _emailv;
  String? _vercode;
  String? _balance;
  dynamic _gender;
  dynamic _address;
  dynamic _zipCode;
  dynamic _city;
  dynamic _country;
  dynamic _vsent;
  String? _secretcode;
  String? _tauth;
  dynamic _refId;
  String? _referralToken;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  dynamic _image;
  String? _imageUrl;

  num? get id => _id;

  String? get name => _name;

  String? get email => _email;

  dynamic get mobile => _mobile;

  dynamic get emailVerifiedAt => _emailVerifiedAt;

  String? get tfver => _tfver;

  String? get emailv => _emailv;

  String? get vercode => _vercode;

  String? get balance => _balance;

  dynamic get gender => _gender;

  dynamic get address => _address;

  dynamic get zipCode => _zipCode;

  dynamic get city => _city;

  dynamic get country => _country;

  dynamic get vsent => _vsent;

  String? get secretcode => _secretcode;

  String? get tauth => _tauth;

  dynamic get refId => _refId;

  String? get referralToken => _referralToken;

  String? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  dynamic get image => _image;

  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['email_verified_at'] = _emailVerifiedAt;
    map['tfver'] = _tfver;
    map['emailv'] = _emailv;
    map['vercode'] = _vercode;
    map['balance'] = _balance;
    map['gender'] = _gender;
    map['address'] = _address;
    map['zip_code'] = _zipCode;
    map['city'] = _city;
    map['country'] = _country;
    map['vsent'] = _vsent;
    map['secretcode'] = _secretcode;
    map['tauth'] = _tauth;
    map['ref_id'] = _refId;
    map['referral_token'] = _referralToken;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['image'] = _image;
    map['image_url'] = _imageUrl;
    return map;
  }
}
