import 'package:flutter/cupertino.dart';
import 'package:flutter_base_template/river_pod/river_notifier.dart';

class MainNotifier extends RiverNotifier<int> {
  MainNotifier(super.state);

  final pageController = PageController();

  @override
  void onInit() {}

  void changeTab(int selectedTab) {
    state = selectedTab;
    pageController.animateToPage(
      selectedTab,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut
    );
  }
}