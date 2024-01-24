import 'package:flutter_base_template/river_pod/river_repository.dart';

class DataDragonRepository extends RiverRepository {
  @override
  RiverRepository createRiverRepo() => DataDragonRepository();

  String getProfileImg(int profileIconId) =>
      'https://ddragon.leagueoflegends.com/cdn/14.1.1/img/profileicon/$profileIconId.png';

  String getChampionIconImg(String name) =>
      'https://ddragon.leagueoflegends.com/cdn/10.11.1/img/champion/$name.png';
}