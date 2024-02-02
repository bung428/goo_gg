import 'package:goo_gg_application/pages/match_detail/enum/detail_tab.dart';

class DetailTabModel {
  DetailTab tab;
  bool selected;

  DetailTabModel({
    required this.tab,
    this.selected = false,
  });
}