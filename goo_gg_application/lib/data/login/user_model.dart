class UserModel {
  String email;
  String pwd;
  DateTime recentAt;

  UserModel({required this.email, required this.pwd, required this.recentAt});

  factory UserModel.init() => UserModel(
    email: '',
    pwd: '',
    recentAt: DateTime.now()
  );

  bool get modelIsNotEmpty => email.isNotEmpty && pwd.isNotEmpty;

  Map<String, dynamic> toJson() => {
    'email': email,
    'pwd': pwd,
    'recentAt': recentAt.toString(),
  };
  
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json['email'],
    pwd: json['pwd'],
    recentAt: DateTime.parse(json['recentAt'])
  );
}