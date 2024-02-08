import 'package:flutter/material.dart';
import 'package:flutter_base_template/river_pod/river_template.dart';
import 'package:goo_gg_application/pages/main/enum/main_tab.dart';
import 'package:goo_gg_application/pages/main/main_notifier.dart';

class MainPage extends RiverProvider<MainNotifier, int> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, provider, MainNotifier notifier) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('GOO.GG', style: theme.textTheme.titleLarge?.copyWith(
          color: theme.primaryColor,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: false,
      ),
      body: SafeArea(
        child: PageView(
          controller: notifier.pageController,
          children: MainTab.values.map((e) => e.getView()).toList(),
        ),
        // child: AnimatedIndexedStackWidget(
        //   index: provider,
        //   children: MainTab.values.map((e) => e.getView()).toList(),
        // )
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: notifier.changeTab,
        items: MainTab.values.map((e) => BottomNavigationBarItem(
            icon: Icon(e.icon),
            label: e.name.toUpperCase()
        ),).toList(),
        currentIndex: provider,
      ),
    );
  }

  @override
  MainNotifier createProvider(ref) => MainNotifier(0);
}