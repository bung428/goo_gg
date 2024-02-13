import 'package:collection/collection.dart';

enum SummonerSpell {
  flash(4, 'SummonerFlash'),
  heal(7, 'SummonerHeal'),
  ignite(14, 'SummonerDot'),
  teleport(12, 'SummonerTeleport'),
  cleanse(1, 'SummonerBoost'),
  barrier(21, 'SummonerBarrier'),
  ghost(6, 'SummonerHaste'),
  exhaust(3, 'SummonerExhaust'),
  clarity(13, 'SummonerMana'),
  smite(11, 'SummonerSmite'),
  mark(32, 'SummonerSnowball'),
  ;

  final int id;
  final String spellName;
  const SummonerSpell(this.id, this.spellName);
}