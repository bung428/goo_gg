import 'package:flutter/material.dart';
import 'package:flutter_base_template/river_pod/river_template.dart';
import 'package:go_router/go_router.dart';
import 'package:goo_gg_application/pages/main/enum/main_tab.dart';
import 'package:goo_gg_application/pages/main/main_notifier.dart';
import 'package:goo_gg_application/pages/test/data/test_type.dart';
import 'package:goo_gg_application/route/routes.dart';

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
      drawer: SafeArea(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)
          ),
          child: Drawer(
            backgroundColor: theme.scaffoldBackgroundColor,
            child: ListView(
              children: [
                const DrawerHeader(child: Text('TestType')),
                ...TestType.values.map((e) => ListTile(
                    onTap: () => context.goNamed(Routes.test.name, extra: e),
                    title: Text(e.name.toUpperCase())
                )).toList()
              ]
            ),
          ),
        ),
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