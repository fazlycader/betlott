class BetLogModel {
  BetLogModel({
    String? pageTitle,
    List<Logs>? logs,
    bool? success,
  }) {
    _pageTitle = pageTitle;
    _logs = logs;
    _success = success;
  }

  BetLogModel.fromJson(dynamic json) {
    _pageTitle = json['page_title'];
    if (json['logs'] != null) {
      _logs = [];
      json['logs'].forEach((v) {
        _logs?.add(Logs.fromJson(v));
      });
    }
    _success = json['success'];
  }

  String? _pageTitle;
  List<Logs>? _logs;
  bool? _success;

  String? get pageTitle => _pageTitle;

  List<Logs>? get logs => _logs;

  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page_title'] = _pageTitle;
    if (_logs != null) {
      map['logs'] = _logs?.map((v) => v.toJson()).toList();
    }
    map['success'] = _success;
    return map;
  }
}

class Logs {
  Logs({
    num? id,
    String? userId,
    String? matchId,
    String? betquestionId,
    String? betoptionId,
    String? investAmount,
    String? returnAmount,
    String? charge,
    String? remainingBalance,
    String? ratio,
    String? status,
    String? createdAt,
    String? updatedAt,
    User? user,
    Match? match,
    Ques? ques,
    Betoption? betoption,
  }) {
    _id = id;
    _userId = userId;
    _matchId = matchId;
    _betquestionId = betquestionId;
    _betoptionId = betoptionId;
    _investAmount = investAmount;
    _returnAmount = returnAmount;
    _charge = charge;
    _remainingBalance = remainingBalance;
    _ratio = ratio;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
    _match = match;
    _ques = ques;
    _betoption = betoption;
  }

  Logs.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _matchId = json['match_id'];
    _betquestionId = json['betquestion_id'];
    _betoptionId = json['betoption_id'];
    _investAmount = json['invest_amount'];
    _returnAmount = json['return_amount'];
    _charge = json['charge'];
    _remainingBalance = json['remaining_balance'];
    _ratio = json['ratio'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _match = json['match'] != null ? Match.fromJson(json['match']) : null;
    _ques = json['ques'] != null ? Ques.fromJson(json['ques']) : null;
    _betoption = json['betoption'] != null ? Betoption.fromJson(json['betoption']) : null;
  }

  num? _id;
  String? _userId;
  String? _matchId;
  String? _betquestionId;
  String? _betoptionId;
  String? _investAmount;
  String? _returnAmount;
  String? _charge;
  String? _remainingBalance;
  String? _ratio;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  User? _user;
  Match? _match;
  Ques? _ques;
  Betoption? _betoption;

  num? get id => _id;

  String? get userId => _userId;

  String? get matchId => _matchId;

  String? get betquestionId => _betquestionId;

  String? get betoptionId => _betoptionId;

  String? get investAmount => _investAmount;

  String? get returnAmount => _returnAmount;

  String? get charge => _charge;

  String? get remainingBalance => _remainingBalance;

  String? get ratio => _ratio;

  String? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  User? get user => _user;

  Match? get match => _match;

  Ques? get ques => _ques;

  Betoption? get betoption => _betoption;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['match_id'] = _matchId;
    map['betquestion_id'] = _betquestionId;
    map['betoption_id'] = _betoptionId;
    map['invest_amount'] = _investAmount;
    map['return_amount'] = _returnAmount;
    map['charge'] = _charge;
    map['remaining_balance'] = _remainingBalance;
    map['ratio'] = _ratio;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_match != null) {
      map['match'] = _match?.toJson();
    }
    if (_ques != null) {
      map['ques'] = _ques?.toJson();
    }
    if (_betoption != null) {
      map['betoption'] = _betoption?.toJson();
    }
    return map;
  }
}

class Betoption {
  Betoption({
    num? id,
    String? questionId,
    String? matchId,
    String? optionName,
    String? investAmount,
    String? returnAmount,
    String? minAmo,
    String? ratio1,
    String? ratio2,
    String? betLimit,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _questionId = questionId;
    _matchId = matchId;
    _optionName = optionName;
    _investAmount = investAmount;
    _returnAmount = returnAmount;
    _minAmo = minAmo;
    _ratio1 = ratio1;
    _ratio2 = ratio2;
    _betLimit = betLimit;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Betoption.fromJson(dynamic json) {
    _id = json['id'];
    _questionId = json['question_id'];
    _matchId = json['match_id'];
    _optionName = json['option_name'];
    _investAmount = json['invest_amount'];
    _returnAmount = json['return_amount'];
    _minAmo = json['min_amo'];
    _ratio1 = json['ratio1'];
    _ratio2 = json['ratio2'];
    _betLimit = json['bet_limit'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _questionId;
  String? _matchId;
  String? _optionName;
  String? _investAmount;
  String? _returnAmount;
  String? _minAmo;
  String? _ratio1;
  String? _ratio2;
  String? _betLimit;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;

  String? get questionId => _questionId;

  String? get matchId => _matchId;

  String? get optionName => _optionName;

  String? get investAmount => _investAmount;

  String? get returnAmount => _returnAmount;

  String? get minAmo => _minAmo;

  String? get ratio1 => _ratio1;

  String? get ratio2 => _ratio2;

  String? get betLimit => _betLimit;

  String? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['question_id'] = _questionId;
    map['match_id'] = _matchId;
    map['option_name'] = _optionName;
    map['invest_amount'] = _investAmount;
    map['return_amount'] = _returnAmount;
    map['min_amo'] = _minAmo;
    map['ratio1'] = _ratio1;
    map['ratio2'] = _ratio2;
    map['bet_limit'] = _betLimit;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Ques {
  Ques({
    num? id,
    String? matchId,
    String? question,
    String? result,
    String? limit,
    String? endTime,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _matchId = matchId;
    _question = question;
    _result = result;
    _limit = limit;
    _endTime = endTime;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Ques.fromJson(dynamic json) {
    _id = json['id'];
    _matchId = json['match_id'];
    _question = json['question'];
    _result = json['result'];
    _limit = json['limit'];
    _endTime = json['end_time'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _matchId;
  String? _question;
  String? _result;
  String? _limit;
  String? _endTime;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;

  String? get matchId => _matchId;

  String? get question => _question;

  String? get result => _result;

  String? get limit => _limit;

  String? get endTime => _endTime;

  String? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['match_id'] = _matchId;
    map['question'] = _question;
    map['result'] = _result;
    map['limit'] = _limit;
    map['end_time'] = _endTime;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Match {
  Match({
    num? id,
    String? catId,
    String? eventId,
    dynamic team1Image,
    dynamic team2Image,
    dynamic team1,
    dynamic team2,
    String? team1Slug,
    String? team2Slug,
    String? startDate,
    String? endDate,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _catId = catId;
    _eventId = eventId;
    _team1Image = team1Image;
    _team2Image = team2Image;
    _team1 = team1;
    _team2 = team2;
    _team1Slug = team1Slug;
    _team2Slug = team2Slug;
    _startDate = startDate;
    _endDate = endDate;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Match.fromJson(dynamic json) {
    _id = json['id'];
    _catId = json['cat_id'];
    _eventId = json['event_id'];
    _team1Image = json['team_1_image'];
    _team2Image = json['team_2_image'];
    _team1 = json['team_1'];
    _team2 = json['team_2'];
    _team1Slug = json['team_1_slug'];
    _team2Slug = json['team_2_slug'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _catId;
  String? _eventId;
  dynamic _team1Image;
  dynamic _team2Image;
  dynamic _team1;
  dynamic _team2;
  String? _team1Slug;
  String? _team2Slug;
  String? _startDate;
  String? _endDate;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;

  String? get catId => _catId;

  String? get eventId => _eventId;

  dynamic get team1Image => _team1Image;

  dynamic get team2Image => _team2Image;

  dynamic get team1 => _team1;

  dynamic get team2 => _team2;

  String? get team1Slug => _team1Slug;

  String? get team2Slug => _team2Slug;

  String? get startDate => _startDate;

  String? get endDate => _endDate;

  String? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cat_id'] = _catId;
    map['event_id'] = _eventId;
    map['team_1_image'] = _team1Image;
    map['team_2_image'] = _team2Image;
    map['team_1'] = _team1;
    map['team_2'] = _team2;
    map['team_1_slug'] = _team1Slug;
    map['team_2_slug'] = _team2Slug;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

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
