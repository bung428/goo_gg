import 'package:flutter_base_template/river_pod/river_notifier.dart';

class MainNotifier extends RiverNotifier<int> {
  MainNotifier(super.state);

  @override
  void onInit() {}

  void changeTab(int selectedTab) {
    state = selectedTab;
  }
}