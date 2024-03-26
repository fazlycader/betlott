/// page_title : "News"
/// news : [{"id":1,"image":"646196677b986559.png","title":"The Basics of Online Sports Betting - Learning the Specific Bets","slug":"the-basics-of-online-sports-betting-learning-the-specific-bets","description":"Betting on sports is done for the thrill of the game and to make money. While betting on sports can seem almost impossible, especially in today's competitive world, it is actually fairly simple. First, you will need to understand the basics of what types of bets are placed. Second, you will need to find a local, or online sportsbook to bet at. Finally, if traditional gambling doesn't suit you, you can always set up your own fantasy sport's league. Once you learn the fundamentals, you will be on your way to gambling on sports in no time!","blog_cat_id":"1","created_at":"2022-03-14T00:25:50.000000Z","updated_at":"2023-05-15T02:20:46.000000Z","image_url":"https://bettpro.s7template.com/public/images/blog/646196677b986559.png"},{"id":2,"image":"62663fede88e7375.png","title":"How to Bet on Sports for Beginners : 12 Tips to Know","slug":"how-to-bet-on-sports-for-beginners-12-tips-to-know","description":"Betting on sports is done for the thrill of the game and to make money. While betting on sports can seem almost impossible, especially in today's competitive world, it is actually fairly simple. First, you will need to understand the basics of what types of bets are placed. Second, you will need to find a local, or online sportsbook to bet at. Finally, if traditional gambling doesn't suit you, you can always set up your own fantasy sport's league. Once you learn the fundamentals, you will be on your way to gambling on sports in no time!","blog_cat_id":"1","created_at":"2022-04-15T05:43:59.000000Z","updated_at":"2023-05-15T02:26:49.000000Z","image_url":"https://bettpro.s7template.com/public/images/blog/62663fede88e7375.png"},{"id":3,"image":"637a3db5a14fe177.jpg","title":"How To Make Money From Free Bets Using Matched Betting","slug":"how-to-make-money-from-free-bets-using-matched-betting","description":"Pellentesque eu ante sed diam placerat molestie vitae vitae ligula.","blog_cat_id":"1","created_at":"2022-04-15T05:44:16.000000Z","updated_at":"2022-11-20T14:46:13.000000Z","image_url":"https://bettpro.s7template.com/public/images/blog/637a3db5a14fe177.jpg"},{"id":4,"image":"637a3bed3bdd2721.jpg","title":"The Basics of Online Sports Betting the Specific Bets","slug":"the-basics-of-online-sports-betting-the-specific-bets","description":"Pellentesque eu ante sed diam placerat molestie vitae vitae ligula.","blog_cat_id":"1","created_at":"2022-04-15T05:44:33.000000Z","updated_at":"2022-11-20T14:39:45.000000Z","image_url":"https://bettpro.s7template.com/public/images/blog/637a3bed3bdd2721.jpg"},{"id":5,"image":"637a3b3a8224e910.jpg","title":"How to Get Started With Sports Betting","slug":"how-to-get-started-with-sports-betting","description":"We have a team of hard-working sports betting content writers ready to offer the best content for your website. They can create all kinds of sports betting content, from sports betting strategy articles to reviews of sports books. By covering a wide range of topics, we can help your business to stand out from its competitors, helping you reach potential players looking for great sports books.","blog_cat_id":"1","created_at":"2022-09-05T02:04:45.000000Z","updated_at":"2022-11-20T14:35:38.000000Z","image_url":"https://bettpro.s7template.com/public/images/blog/637a3b3a8224e910.jpg"},{"id":6,"image":"646197e728b7d933.png","title":"Put your money down on the totals. Totals is commonly","slug":"put-your-money-down-on-the-totals-totals-is-commonly","description":"Betting on sports is done for the thrill of the game and to make money. While betting on sports can seem almost impossible, especially in today's competitive world, it is actually fairly simple. First, you will need to understand the basics of what types of bets are placed. Second, you will need to find a local, or online sportsbook to bet at. Finally, if traditional gambling doesn't suit you, you can always set up your own fantasy sport's league. Once you learn the fundamentals, you will be on your way to gambling on sports in no time!","blog_cat_id":"1","created_at":"2023-05-15T02:24:39.000000Z","updated_at":"2023-05-15T02:26:01.000000Z","image_url":"https://bettpro.s7template.com/public/images/blog/646197e728b7d933.png"}]
/// social : [{"id":1,"icon":"facebook","link":"https://facebook.com/","created_at":"2022-04-21T01:24:59.000000Z","updated_at":"2022-04-21T01:30:42.000000Z"},{"id":2,"icon":"twitter","link":"https://twitter.com/","created_at":"2022-04-21T01:25:58.000000Z","updated_at":"2022-04-21T01:25:58.000000Z"},{"id":3,"icon":"instagram","link":"https://instagram.com/","created_at":"2022-04-21T01:37:34.000000Z","updated_at":"2022-04-21T01:37:34.000000Z"},{"id":4,"icon":"youtube","link":"https://youtube.com/","created_at":"2022-04-21T01:44:58.000000Z","updated_at":"2022-04-21T01:44:58.000000Z"}]
/// success : true

// ignore_for_file: dangling_library_doc_comments

class NewsListModel {
  NewsListModel({
    String? pageTitle,
    List<News>? news,
    List<Social>? social,
    bool? success,
  }) {
    _pageTitle = pageTitle;
    _news = news;
    _social = social;
    _success = success;
  }

  NewsListModel.fromJson(dynamic json) {
    _pageTitle = json['page_title'];
    if (json['news'] != null) {
      _news = [];
      json['news'].forEach((v) {
        _news?.add(News.fromJson(v));
      });
    }
    if (json['social'] != null) {
      _social = [];
      json['social'].forEach((v) {
        _social?.add(Social.fromJson(v));
      });
    }
    _success = json['success'];
  }

  String? _pageTitle;
  List<News>? _news;
  List<Social>? _social;
  bool? _success;

  String? get pageTitle => _pageTitle;

  List<News>? get news => _news;

  List<Social>? get social => _social;

  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page_title'] = _pageTitle;
    if (_news != null) {
      map['news'] = _news?.map((v) => v.toJson()).toList();
    }
    if (_social != null) {
      map['social'] = _social?.map((v) => v.toJson()).toList();
    }
    map['success'] = _success;
    return map;
  }
}

/// id : 1
/// icon : "facebook"
/// link : "https://facebook.com/"
/// created_at : "2022-04-21T01:24:59.000000Z"
/// updated_at : "2022-04-21T01:30:42.000000Z"

class Social {
  Social({
    int? id,
    String? icon,
    String? link,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _icon = icon;
    _link = link;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Social.fromJson(dynamic json) {
    _id = json['id'];
    _icon = json['icon'];
    _link = json['link'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _icon;
  String? _link;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

  String? get icon => _icon;

  String? get link => _link;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['icon'] = _icon;
    map['link'] = _link;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

/// id : 1
/// image : "646196677b986559.png"
/// title : "The Basics of Online Sports Betting - Learning the Specific Bets"
/// slug : "the-basics-of-online-sports-betting-learning-the-specific-bets"
/// description : "Betting on sports is done for the thrill of the game and to make money. While betting on sports can seem almost impossible, especially in today's competitive world, it is actually fairly simple. First, you will need to understand the basics of what types of bets are placed. Second, you will need to find a local, or online sportsbook to bet at. Finally, if traditional gambling doesn't suit you, you can always set up your own fantasy sport's league. Once you learn the fundamentals, you will be on your way to gambling on sports in no time!"
/// blog_cat_id : "1"
/// created_at : "2022-03-14T00:25:50.000000Z"
/// updated_at : "2023-05-15T02:20:46.000000Z"
/// image_url : "https://bettpro.s7template.com/public/images/blog/646196677b986559.png"

class News {
  News({
    int? id,
    String? image,
    String? title,
    String? slug,
    String? description,
    String? blogCatId,
    String? createdAt,
    String? updatedAt,
    String? imageUrl,
  }) {
    _id = id;
    _image = image;
    _title = title;
    _slug = slug;
    _description = description;
    _blogCatId = blogCatId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _imageUrl = imageUrl;
  }

  News.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _title = json['title'];
    _slug = json['slug'];
    _description = json['description'];
    _blogCatId = json['blog_cat_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _imageUrl = json['image_url'];
  }

  int? _id;
  String? _image;
  String? _title;
  String? _slug;
  String? _description;
  String? _blogCatId;
  String? _createdAt;
  String? _updatedAt;
  String? _imageUrl;

  int? get id => _id;

  String? get image => _image;

  String? get title => _title;

  String? get slug => _slug;

  String? get description => _description;

  String? get blogCatId => _blogCatId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['title'] = _title;
    map['slug'] = _slug;
    map['description'] = _description;
    map['blog_cat_id'] = _blogCatId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['image_url'] = _imageUrl;
    return map;
  }
}
