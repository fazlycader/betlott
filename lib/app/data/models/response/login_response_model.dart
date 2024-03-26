/// login : true
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTVhOTQyNWJiYTZkYzUxNGEzZTg1MjRjYTczMThkNzJlY2Y0MzgxZmM5ZGY2NDEzYzg5YjEzNjZiMTdkYmU0NTU5NWVlYTc3YzVlYjNmZmQiLCJpYXQiOjE2ODM1NjMwNTEuNzAxOTE3LCJuYmYiOjE2ODM1NjMwNTEuNzAxOTIsImV4cCI6MTcxNTE4NTQ1MS42OTc1NTYsInN1YiI6IjciLCJzY29wZXMiOltdfQ.A19Kgst06tPwzyIndbmvzQskpznddlAvR0v12cevjoCPJYcVa9W2G1qRTvUM83E3Tv9sknmxzeJ8vHsKW67mq8bS5J2n8NCuGHVQKhkeggUaboPB9mkkcC01-bH6-yLBU1ZnblidK9ub7zG6X1HSP9obqazvirRQyjoo0h2cX6r1ZTFQvct0ziAUHjWITkpTH8vI19A_sCiEGQ-VkMXmG7OZFGElu1VDaW3ykOZifkwdHLLOZz69VnTipq1qIpp3gsFd0nIxectbru01MKNytnppUicij0vtjakVgNUvxJB-wxHuheDk4DTSdPzuIkS_M2Qx9lmvmnwtbppbnMJlK5K56UKe1Vn3tXjm5T0voTNu_KTasXrGLhHThsgQsoXB1Xcu5-4CSFFytuOvm2hFc1zh24gkYpKTIb0Stl7LZD9wcBI1DL8ek82LppsZE3Aef3qky4fAOwa0ArKB7qP2fj6GIFMp2vDNroRitsxXx_P3fJq__MMxjzhPNmSzC3vLsXFoKW3hTNzqsJxooQGc2Je-1da5jF0l4CkK9MCyalnJTP-VnKCBuEpNQw6s_nKF2KgqF_EdUdjBi4dUR03twMoZC2fS80AQTwnXQC9-LUg9YUfth0RvRZcb0hV6HDxa_64di5Fb1POANBM3U0cgiv202xtw8HIf3EgMoOgoMTk"
/// data : {"id":7,"name":"Prince Mahmud","email":"princey01767@gmail.com","mobile":null,"email_verified_at":null,"tfver":"0","emailv":"0","vercode":"0","balance":"0","gender":null,"address":null,"zip_code":null,"city":null,"country":null,"vsent":null,"secretcode":"0","tauth":"0","ref_id":null,"referral_token":"644cb7de29bbe","status":"1","created_at":"2023-04-29T06:23:26.000000Z","updated_at":"2023-04-29T06:29:09.000000Z","image":null,"image_url":"https://betpro.s7template.com/public/images/user-default.jpg"}

// ignore_for_file: dangling_library_doc_comments

class LoginResponseModel {
  LoginResponseModel({
    bool? login,
    String? token,
    String? message,
    Data? data,
  }) {
    _login = login;
    _token = token;
    _message = message;
    _data = data;
  }

  LoginResponseModel.fromJson(dynamic json) {
    _login = json['login'];
    _token = json['token'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _login;
  String? _token;
  String? _message;
  Data? _data;

  bool? get login => _login;

  String? get token => _token;

  String? get message => _message;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = _login;
    map['token'] = _token;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// id : 7
/// name : "Prince Mahmud"
/// email : "princey01767@gmail.com"
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
/// referral_token : "644cb7de29bbe"
/// status : "1"
/// created_at : "2023-04-29T06:23:26.000000Z"
/// updated_at : "2023-04-29T06:29:09.000000Z"
/// image : null
/// image_url : "https://betpro.s7template.com/public/images/user-default.jpg"

class Data {
  Data({
    int? id,
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

  Data.fromJson(dynamic json) {
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

  int? _id;
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

  int? get id => _id;

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
