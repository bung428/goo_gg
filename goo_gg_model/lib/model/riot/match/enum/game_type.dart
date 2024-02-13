enum GameType {
  soloRank('솔로 랭크', 420, 'RANKED_SOLO_5x5'),
  freeRank('자유 랭크', 440, 'RANKED_FLEX_SR'),
  normal('일반 게임', 430, 'NORMAL_5x5_BLIND'),
  normalDraft('일반 게임', 400, 'NORMAL_5x5_DRAFT'),
  aram('칼바람', 450, 'ARAM_5x5'),
  ;

  final String type;
  final String queue;
  final int id;
  const GameType(this.type, this.id, this.queue);
}