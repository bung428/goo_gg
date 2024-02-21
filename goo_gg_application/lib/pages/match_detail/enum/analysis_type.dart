enum AnalysisType {
  kda('킬 관여'),
  damage('가한 피해량'),
  damageTaken('받은 피해량'),
  damageToChampion('챔피언 피해량'),
  gold('골드'),
  turret('타워'),
  object('오브젝트'),
  visionScore('시야 점수'),
  pings('핑'),
  ;

  final String title;
  const AnalysisType(this.title);
}