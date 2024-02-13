import 'package:goo_gg_model/model/riot/summoner/summoner_entry_model.dart';

const assetUrl = 'assets/images/';
extension SummonerEntryModelExt on SummonerEntryModel {
  String get tierImg => switch (tier) {
    'IRON' => 'Rank=Iron',
    'BRONZE' => 'Rank=Bronze',
    'SILVER' => 'Rank=Silver',
    'GOLD' => 'Rank=Gold',
    'PLATINUM' => 'Rank=Platinum',
    'EMERALD' => 'Rank=Emerald',
    'DIAMOND' => 'Rank=Diamond',
    'MASTER' => 'Rank=Master',
    'GRANDMASTER' => 'Rank=Grandmaster',
    'CHALLENGER' => 'Rank=Challenger',
    (_) => 'Rank=Unranked',
  };
}