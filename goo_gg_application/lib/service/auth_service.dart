import 'package:goo_gg_application/data/login/user_model.dart';
import 'package:goo_gg_application/service/app_service.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  static final AuthService instance = AuthService._();

  AuthService._();

  final _user = BehaviorSubject<UserModel?>();
  Future<UserModel?> get userFuture => _user.single;
  Stream<UserModel?> get userStream => _user.stream;

  void init() {

  }

  Future<void> signIn(UserModel model) async {
    _user.value = model;
    AppService.instance.isLogin = _user.value != null;
  }
}