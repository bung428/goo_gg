import 'package:goo_gg_application/data/login/user_model.dart';
import 'package:goo_gg_application/data/summoner/model/summoner_model.dart';
import 'package:goo_gg_application/helper/preferences_helper.dart';
import 'package:goo_gg_application/service/app_service.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  static final AuthService instance = AuthService._();

  AuthService._();

  final _user = BehaviorSubject<UserModel?>();
  Future<UserModel?> get userFuture => _user.first;
  Stream<UserModel?> get userStream => _user.stream;

  final _summoner = BehaviorSubject<SummonerModel?>()..value = null;
  Future<SummonerModel?> get summonerFuture => _summoner.first;
  Stream<SummonerModel?> get summonerStream => _summoner.stream;

  Future<void> init() async {
    final userResult = await SharedPreferencesKey.user.get<Map>();
    if (userResult != null) {
      _user.value = UserModel.fromJson(userResult as Map<String, dynamic>);
    }
  }

  Future<void> signIn(UserModel model) async {
    _user.value = model;
    SharedPreferencesKey.user.set(model.toJson());
    AppService.instance.isLogin = _user.value != null;
  }

  Future<void> setSummonerInfo(SummonerModel model) async {
    _summoner.value = model;
  }
}