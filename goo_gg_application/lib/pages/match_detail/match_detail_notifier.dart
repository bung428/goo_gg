import 'package:flutter/cupertino.dart';
import 'package:flutter_base_template/river_pod/river_notifier.dart';
import 'package:goo_gg_application/model/detail_tab_model.dart';
import 'package:goo_gg_application/pages/match_detail/enum/detail_tab.dart';

class MatchDetailViewModel {
  final List<DetailTabModel>? tabs;

  MatchDetailViewModel({this.tabs});

  MatchDetailViewModel copyWith({
    List<DetailTabModel>? tabs,
  }) => MatchDetailViewModel(
    tabs: tabs ?? this.tabs
  );
}

class MatchDetailNotifier extends RiverNotifier<MatchDetailViewModel> {
  MatchDetailNotifier(super.state);

  @override
  void onInit() {
    state = state.copyWith(
      tabs: DetailTab.values
        .map((e) => DetailTabModel(
          tab: e,
          selected: e == DetailTab.values.first ? true : false))
        .toList());
  }

  void changeTab(DetailTab tab) {
    var list = state.tabs;
    if (list == null || list.isEmpty) return;
    for (var tabModel in list) {
      tabModel.selected = (tabModel.tab == tab);
    }

    // final selected = list.firstWhere((e) => e.selected);
    // pageController.animateToPage(
    //   DetailTab.values.indexOf(selected.tab),
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeIn
    // );

    state = state.copyWith(tabs: list);
  }
}