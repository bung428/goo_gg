import 'package:collection/collection.dart';

enum RuneType {
  domination(8100, 'perk-images/Styles/7200_Domination.png'),
  precision(8000, 'perk-images/Styles/7201_Precision.png'),
  sorcery(8200, 'perk-images/Styles/7202_Sorcery.png'),
  inspiration(8300, 'perk-images/Styles/7203_Whimsy.png'),
  resolve(8400, 'perk-images/Styles/7204_Resolve.png'),
  ;

  final int id;
  final String url;
  const RuneType(this.id, this.url);
}