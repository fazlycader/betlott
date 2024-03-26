class PaymentGatewayModel {
  PaymentGatewayModel({
    String? pageTitle,
    List<Gateways>? gateways,
    bool? success,
  }) {
    _pageTitle = pageTitle;
    _gateways = gateways;
    _success = success;
  }

  PaymentGatewayModel.fromJson(dynamic json) {
    _pageTitle = json['page_title'];
    if (json['gateways'] != null) {
      _gateways = [];
      json['gateways'].forEach((v) {
        _gateways?.add(Gateways.fromJson(v));
      });
    }
    _success = json['success'];
  }

  String? _pageTitle;
  List<Gateways>? _gateways;
  bool? _success;

  String? get pageTitle => _pageTitle;

  List<Gateways>? get gateways => _gateways;

  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page_title'] = _pageTitle;
    if (_gateways != null) {
      map['gateways'] = _gateways?.map((v) => v.toJson()).toList();
    }
    map['success'] = _success;
    return map;
  }
}

class Gateways {
  Gateways(
      {num? id,
      String? image,
      String? name,
      String? minimumDepositAmount,
      String? maximumDepositAmount,
      String? rate,
      String? fixedCharge,
      String? percentageCharge,
      String? gatewayKeyOne,
      String? gatewayKeyTwo,
      String? gatewayKeyThree,
      dynamic gatewayKeyFour,
      String? status,
      String? createdAt,
      String? updatedAt,
      String? imageUrl,
      String? clientId,
      String? secretKey,
      String? appId,
      dynamic acPhoneNum,
      dynamic accountDetais}) {
    _id = id;
    _image = image;
    _name = name;
    _minimumDepositAmount = minimumDepositAmount;
    _maximumDepositAmount = maximumDepositAmount;
    _rate = rate;
    _fixedCharge = fixedCharge;
    _percentageCharge = percentageCharge;
    _gatewayKeyOne = gatewayKeyOne;
    _gatewayKeyTwo = gatewayKeyTwo;
    _gatewayKeyThree = gatewayKeyThree;
    _gatewayKeyFour = gatewayKeyFour;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _imageUrl = imageUrl;
    _clientId = clientId;
    _secretKey = secretKey;
    _appId = appId;
    _acPhoneNum = acPhoneNum;
    _accountDetais = accountDetais;
  }

  Gateways.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _minimumDepositAmount = json['minimum_deposit_amount'];
    _maximumDepositAmount = json['maximum_deposit_amount'];
    _rate = json['rate'];
    _fixedCharge = json['fixed_charge'];
    _percentageCharge = json['percentage_charge'];
    _gatewayKeyOne = json['gateway_key_one'];
    _gatewayKeyTwo = json['gateway_key_two'];
    _gatewayKeyThree = json['gateway_key_three'];
    _gatewayKeyFour = json['gateway_key_four'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _imageUrl = json['image_url'];
    _clientId = json['client_id'];
    _secretKey = json['secret_key'];
    _appId = json['app_id'];
    _acPhoneNum = json['ac_phone_num'];
    _accountDetais = json['account_detais'];
  }

  num? _id;
  String? _image;
  String? _name;
  String? _minimumDepositAmount;
  String? _maximumDepositAmount;
  String? _rate;
  String? _fixedCharge;
  String? _percentageCharge;
  String? _gatewayKeyOne;
  String? _gatewayKeyTwo;
  String? _gatewayKeyThree;
  dynamic _gatewayKeyFour;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _imageUrl;
  String? _clientId;
  String? _secretKey;
  String? _appId;
  dynamic _acPhoneNum;
  dynamic _accountDetais;

  num? get id => _id;

  String? get image => _image;

  String? get name => _name;

  String? get minimumDepositAmount => _minimumDepositAmount;

  String? get maximumDepositAmount => _maximumDepositAmount;

  String? get rate => _rate;

  String? get fixedCharge => _fixedCharge;

  String? get percentageCharge => _percentageCharge;

  String? get gatewayKeyOne => _gatewayKeyOne;

  String? get gatewayKeyTwo => _gatewayKeyTwo;

  String? get gatewayKeyThree => _gatewayKeyThree;

  dynamic get gatewayKeyFour => _gatewayKeyFour;

  String? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get imageUrl => _imageUrl;

  String? get clientId => _clientId;

  String? get secretKey => _secretKey;

  String? get appId => _appId;

  dynamic get acPhoneNum => _acPhoneNum;

  dynamic get accountDetais => _accountDetais;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['name'] = _name;
    map['minimum_deposit_amount'] = _minimumDepositAmount;
    map['maximum_deposit_amount'] = _maximumDepositAmount;
    map['rate'] = _rate;
    map['fixed_charge'] = _fixedCharge;
    map['percentage_charge'] = _percentageCharge;
    map['gateway_key_one'] = _gatewayKeyOne;
    map['gateway_key_two'] = _gatewayKeyTwo;
    map['gateway_key_three'] = _gatewayKeyThree;
    map['gateway_key_four'] = _gatewayKeyFour;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['image_url'] = _imageUrl;
    map['client_id'] = _clientId;
    map['secret_key'] = _secretKey;
    map['app_id'] = _appId;
    map['ac_phone_num'] = _acPhoneNum;
    map['account_detais'] = _accountDetais;
    return map;
  }
}
