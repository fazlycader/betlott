class CategoryMatchModel {
  CategoryMatchModel({
    String? pageTitle,
    List<Matches>? matches,
    num? users,
    num? totalPrediction,
    bool? success,
  }) {
    _pageTitle = pageTitle;
    _matches = matches;
    _users = users;
    _totalPrediction = totalPrediction;
    _success = success;
  }

  CategoryMatchModel.fromJson(dynamic json) {
    _pageTitle = json['page_title'];
    if (json['matches'] != null) {
      _matches = [];
      json['matches'].forEach((v) {
        _matches?.add(Matches.fromJson(v));
      });
    }
    _users = json['users'];
    _totalPrediction = json['totalPrediction'];
    _success = json['success'];
  }

  String? _pageTitle;
  List<Matches>? _matches;
  num? _users;
  num? _totalPrediction;
  bool? _success;

  String? get pageTitle => _pageTitle;

  List<Matches>? get matches => _matches;

  num? get users => _users;

  num? get totalPrediction => _totalPrediction;

  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page_title'] = _pageTitle;
    if (_matches != null) {
      map['matches'] = _matches?.map((v) => v.toJson()).toList();
    }
    map['users'] = _users;
    map['totalPrediction'] = _totalPrediction;
    map['success'] = _success;
    return map;
  }
}

class Matches {
  Matches({
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
    String? imageUrlTeam1,
    String? imageUrlTeam2,
    Cat? cat,
    Event? event,
    List<Questions>? questions,
    List<Options>? options,
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
    _imageUrlTeam1 = imageUrlTeam1;
    _imageUrlTeam2 = imageUrlTeam2;
    _cat = cat;
    _event = event;
    _questions = questions;
    _options = options;
  }

  Matches.fromJson(dynamic json) {
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
    _imageUrlTeam1 = json['image_url_team_1'];
    _imageUrlTeam2 = json['image_url_team_2'];
    _cat = json['cat'] != null ? Cat.fromJson(json['cat']) : null;
    _event = json['event'] != null ? Event.fromJson(json['event']) : null;
    if (json['questions'] != null) {
      _questions = [];
      json['questions'].forEach((v) {
        _questions?.add(Questions.fromJson(v));
      });
    }
    if (json['options'] != null) {
      _options = [];
      json['options'].forEach((v) {
        _options?.add(Options.fromJson(v));
      });
    }
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
  String? _imageUrlTeam1;
  String? _imageUrlTeam2;
  Cat? _cat;
  Event? _event;
  List<Questions>? _questions;
  List<Options>? _options;

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

  String? get imageUrlTeam1 => _imageUrlTeam1;

  String? get imageUrlTeam2 => _imageUrlTeam2;

  Cat? get cat => _cat;

  Event? get event => _event;

  List<Questions>? get questions => _questions;

  List<Options>? get options => _options;

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
    map['image_url_team_1'] = _imageUrlTeam1;
    map['image_url_team_2'] = _imageUrlTeam2;
    if (_cat != null) {
      map['cat'] = _cat?.toJson();
    }
    if (_event != null) {
      map['event'] = _event?.toJson();
    }
    if (_questions != null) {
      map['questions'] = _questions?.map((v) => v.toJson()).toList();
    }
    if (_options != null) {
      map['options'] = _options?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Options {
  Options({
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

  Options.fromJson(dynamic json) {
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

class Questions {
  Questions({
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

  Questions.fromJson(dynamic json) {
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

class Event {
  Event({
    num? id,
    String? catId,
    String? name,
    String? slug,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? key,
  }) {
    _id = id;
    _catId = catId;
    _name = name;
    _slug = slug;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _key = key;
  }

  Event.fromJson(dynamic json) {
    _id = json['id'];
    _catId = json['cat_id'];
    _name = json['name'];
    _slug = json['slug'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _key = json['key'];
  }

  num? _id;
  String? _catId;
  String? _name;
  String? _slug;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _key;

  num? get id => _id;

  String? get catId => _catId;

  String? get name => _name;

  String? get slug => _slug;

  String? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get key => _key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cat_id'] = _catId;
    map['name'] = _name;
    map['slug'] = _slug;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['key'] = _key;
    return map;
  }
}

class Cat {
  Cat({
    num? id,
    String? name,
    String? slug,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? icon,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _icon = icon;
  }

  Cat.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _icon = json['icon'];
  }

  num? _id;
  String? _name;
  String? _slug;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _icon;

  num? get id => _id;

  String? get name => _name;

  String? get slug => _slug;

  String? get status => _status;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['icon'] = _icon;
    return map;
  }
}
