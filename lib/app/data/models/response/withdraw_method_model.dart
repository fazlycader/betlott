class WithdrawMethodModel {
  WithdrawMethodModel({
    String? pageTitle,
    List<Gateways>? gateways,
    bool? success,
  }) {
    _pageTitle = pageTitle;
    _gateways = gateways;
    _success = success;
  }

  WithdrawMethodModel.fromJson(dynamic json) {
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
  Gateways({
    num? id,
    String? name,
    String? image,
    String? minAmo,
    String? maxAmo,
    String? chargefx,
    String? chargepc,
    String? rate,
    String? processingDay,
    String? currency,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? imageUrl,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _minAmo = minAmo;
    _maxAmo = maxAmo;
    _chargefx = chargefx;
    _chargepc = chargepc;
    _rate = rate;
    _processingDay = processingDay;
    _currency = currency;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _imageUrl = imageUrl;
  }

  Gateways.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _minAmo = json['min_amo'];
    _maxAmo = json['max_amo'];
    _chargefx = json['chargefx'];
    _chargepc = json['chargepc'];
    _rate = json['rate'];
    _processingDay = json['processing_day'];
    _currency = json['currency'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _imageUrl = json['image_url'];
  }

  num? _id;
  String? _name;
  String? _image;
  String? _minAmo;
  String? _maxAmo;
  String? _chargefx;
  String? _chargepc;
  String? _rate;
  String? _processingDay;
  String? _currency;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _imageUrl;

  num? get id => _id;

  String? get name => _name;

  String? get image => _image;

  String? get minAmo => _minAmo;

  String? get maxAmo => _maxAmo;

  String? get chargefx => _chargefx;

  String? get chargepc => _chargepc;

  String? get rate => _rate;

  String? get processingDay => _processingDay;

  String? get currency => _currency;

  String? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['min_amo'] = _minAmo;
    map['max_amo'] = _maxAmo;
    map['chargefx'] = _chargefx;
    map['chargepc'] = _chargepc;
    map['rate'] = _rate;
    map['processing_day'] = _processingDay;
    map['currency'] = _currency;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['image_url'] = _imageUrl;
    return map;
  }
}
