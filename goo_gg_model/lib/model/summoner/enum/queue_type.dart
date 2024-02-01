enum QueueType {
  solo('RANKED_SOLO_5x5', '솔랭'),
  free('RANKED_FLEX_SR', '자랭'),
  ;

  final String type;
  final String title;
  const QueueType(this.type, this.title);
}