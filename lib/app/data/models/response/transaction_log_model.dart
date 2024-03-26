class TransactionLogModel {
  TransactionLogModel({
    String? pageTitle,
    Trans? trans,
    bool? success,
  }) {
    _pageTitle = pageTitle;
    _trans = trans;
    _success = success;
  }

  TransactionLogModel.fromJson(dynamic json) {
    _pageTitle = json['page_title'];
    _trans = json['trans'] != null ? Trans.fromJson(json['trans']) : null;
    _success = json['success'];
  }

  String? _pageTitle;
  Trans? _trans;
  bool? _success;

  String? get pageTitle => _pageTitle;

  Trans? get trans => _trans;

  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page_title'] = _pageTitle;
    if (_trans != null) {
      map['trans'] = _trans?.toJson();
    }
    map['success'] = _success;
    return map;
  }
}

class Trans {
  Trans({
    num? currentPage,
    List<Data>? data,
    String? firstPageUrl,
    num? from,
    num? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    String? nextPageUrl,
    String? path,
    num? perPage,
    dynamic prevPageUrl,
    num? to,
    num? total,
  }) {
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
  }

  Trans.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }

  num? _currentPage;
  List<Data>? _data;
  String? _firstPageUrl;
  num? _from;
  num? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  String? _nextPageUrl;
  String? _path;
  num? _perPage;
  dynamic _prevPageUrl;
  num? _to;
  num? _total;

  num? get currentPage => _currentPage;

  List<Data>? get data => _data;

  String? get firstPageUrl => _firstPageUrl;

  num? get from => _from;

  num? get lastPage => _lastPage;

  String? get lastPageUrl => _lastPageUrl;

  List<Links>? get links => _links;

  String? get nextPageUrl => _nextPageUrl;

  String? get path => _path;

  num? get perPage => _perPage;

  dynamic get prevPageUrl => _prevPageUrl;

  num? get to => _to;

  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }
}

class Links {
  Links({
    dynamic url,
    String? label,
    bool? active,
  }) {
    _url = url;
    _label = label;
    _active = active;
  }

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }

  dynamic _url;
  String? _label;
  bool? _active;

  dynamic get url => _url;

  String? get label => _label;

  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }
}

class Data {
  Data({
    num? id,
    String? userId,
    String? transId,
    String? description,
    String? amount,
    String? oldBal,
    String? newBal,
    String? type,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? title,
    String? trx,
    String? mainAmo,
    String? charge,
  }) {
    _id = id;
    _userId = userId;
    _transId = transId;
    _description = description;
    _amount = amount;
    _oldBal = oldBal;
    _newBal = newBal;
    _type = type;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _title = title;
    _trx = trx;
    _mainAmo = mainAmo;
    _charge = charge;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _transId = json['trans_id'];
    _description = json['description'];
    _amount = json['amount'];
    _oldBal = json['old_bal'];
    _newBal = json['new_bal'];
    _type = json['type'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _title = json['title'];
    _trx = json['trx'];
    _mainAmo = json['main_amo'];
    _charge = json['charge'];
  }

  num? _id;
  String? _userId;
  String? _transId;
  String? _description;
  String? _amount;
  String? _oldBal;
  String? _newBal;
  String? _type;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _title;
  String? _trx;
  String? _mainAmo;
  String? _charge;

  num? get id => _id;

  String? get userId => _userId;

  String? get transId => _transId;

  String? get description => _description;

  String? get amount => _amount;

  String? get oldBal => _oldBal;

  String? get newBal => _newBal;

  String? get type => _type;

  String? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get title => _title;

  String? get trx => _trx;

  String? get mainAmo => _mainAmo;

  String? get charge => _charge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['trans_id'] = _transId;
    map['description'] = _description;
    map['amount'] = _amount;
    map['old_bal'] = _oldBal;
    map['new_bal'] = _newBal;
    map['type'] = _type;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['title'] = _title;
    map['trx'] = _trx;
    map['main_amo'] = _mainAmo;
    map['charge'] = _charge;
    return map;
  }
}
