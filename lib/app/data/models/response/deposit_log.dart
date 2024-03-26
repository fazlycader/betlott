class DepositLog {
  DepositLog({
    String? pageTitle,
    List<Deposits>? deposits,
    bool? success,
  }) {
    _pageTitle = pageTitle;
    _deposits = deposits;
    _success = success;
  }

  DepositLog.fromJson(dynamic json) {
    _pageTitle = json['page_title'];
    if (json['deposits'] != null) {
      _deposits = [];
      json['deposits'].forEach((v) {
        _deposits?.add(Deposits.fromJson(v));
      });
    }
    _success = json['success'];
  }

  String? _pageTitle;
  List<Deposits>? _deposits;
  bool? _success;

  String? get pageTitle => _pageTitle;

  List<Deposits>? get deposits => _deposits;

  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page_title'] = _pageTitle;
    if (_deposits != null) {
      map['deposits'] = _deposits?.map((v) => v.toJson()).toList();
    }
    map['success'] = _success;
    return map;
  }
}

class Deposits {
  Deposits({
    num? id,
    String? userId,
    String? gatewayId,
    String? amount,
    String? charge,
    String? usdAmo,
    String? trx,
    String? status,
    String? trys,
    String? createdAt,
    String? updatedAt,
    num? isManual,
    dynamic depositRequestTable,
  }) {
    _id = id;
    _userId = userId;
    _gatewayId = gatewayId;
    _amount = amount;
    _charge = charge;
    _usdAmo = usdAmo;
    _trx = trx;
    _status = status;
    _trys = trys;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _isManual = isManual;
    _depositRequestTable = depositRequestTable;
  }

  Deposits.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _gatewayId = json['gateway_id'];
    _amount = json['amount'];
    _charge = json['charge'];
    _usdAmo = json['usd_amo'];
    _trx = json['trx'];
    _status = json['status'];
    _trys = json['try'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isManual = json['is_manual'];
    _depositRequestTable = json['deposit_request_table'];
  }

  num? _id;
  String? _userId;
  String? _gatewayId;
  String? _amount;
  String? _charge;
  String? _usdAmo;
  String? _trx;
  String? _status;
  String? _trys;
  String? _createdAt;
  String? _updatedAt;
  num? _isManual;
  dynamic _depositRequestTable;

  num? get id => _id;

  String? get userId => _userId;

  String? get gatewayId => _gatewayId;

  String? get amount => _amount;

  String? get charge => _charge;

  String? get usdAmo => _usdAmo;

  String? get trx => _trx;

  String? get status => _status;

  String? get trys => _trys;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  num? get isManual => _isManual;

  dynamic get depositRequestTable => _depositRequestTable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['gateway_id'] = _gatewayId;
    map['amount'] = _amount;
    map['charge'] = _charge;
    map['usd_amo'] = _usdAmo;
    map['trx'] = _trx;
    map['status'] = _status;
    map['try'] = _trys;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['is_manual'] = _isManual;
    map['deposit_request_table'] = _depositRequestTable;
    return map;
  }
}
