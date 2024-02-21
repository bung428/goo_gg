enum PingType {
  back('후퇴'),
  danger('위험'),
  push('압박'),
  onMyWay('가고있다'),
  allIn('총공격'),
  assistMe('지원'),
  needVision('시야 필요'),
  enemyMissing('미아'),
  enemyVision('적 시야'),
  ;

  final String desc;
  const PingType(this.desc);
}