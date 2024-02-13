import 'package:goo_gg_application/data/login/user_model.dart';
import 'package:goo_gg_application/data/summoner/model/summoner_model.dart';
import 'package:goo_gg_application/helper/preferences_helper.dart';
import 'package:goo_gg_application/service/app_service.dart';
import 'package:goo_gg_model/model/riot/summoner/summoner_entry_model.dart';
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

  final _summonerEntries = BehaviorSubject<List<SummonerEntryModel>?>()..value = null;
  Future<List<SummonerEntryModel>?> get entriesFuture => _summonerEntries.first;
  Stream<List<SummonerEntryModel>?> get entriesStream => _summonerEntries.stream;

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
    print('KBg model : ${model.toJson()}');
    _summoner.value = model;
  }

  Future<void> setSummonerEntries(List<SummonerEntryModel> list) async {
    print('KBg list : $list');
    _summonerEntries.value = list;
  }
}