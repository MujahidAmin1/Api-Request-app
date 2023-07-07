class User {
  int? id;
  int? userId;
  String? title;
  String? body;
  User({this.id, this.userId, this.title, this.body});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}
