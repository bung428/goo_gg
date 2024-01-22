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
}