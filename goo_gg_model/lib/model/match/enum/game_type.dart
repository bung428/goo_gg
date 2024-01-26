enum GameType {
  soloRank('솔로 랭크'),
  freeRank('자유 랭크'),
  normal('일반 게임'),
  aram('무작위 칼바람 나락'),
  ;

  final String type;
  const GameType(this.type);
}