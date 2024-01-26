class SummonerRecordModel {
  final String championUrl;
  final int championLevel;
  final List<String> spells;
  final List<String> runes;
  final int kill;
  final int death;
  final int assist;
  final double grade;
  final List<String> items;
  final double? opScore;

  SummonerRecordModel({
    required this.championUrl,
    required this.championLevel,
    required this.spells,
    required this.runes,
    required this.kill,
    required this.death,
    required this.assist,
    required this.grade,
    required this.items,
    this.opScore
  });

  Map<String, dynamic> toJson() => {
    'championUrl' : championUrl,
    'championLevel' : championLevel,
    'spells' : spells,
    'runes' : runes,
    'kill' : kill,
    'death' : death,
    'assist' : assist,
    'grade' : grade,
    'items' : items,
  };
}