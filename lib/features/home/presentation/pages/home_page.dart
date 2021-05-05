import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_template/core/router/router.gr.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsRouter(
        routes: [
          CounterRoute(),
          NicknameGeneratorRoute(),
        ],
        duration: const Duration(milliseconds: 100),
        builder: (context, child, animation) {
          final tabsRouter = context.tabsRouter;
          return Scaffold(
            body: child,
            bottomNavigationBar: buildBottomNavigationBar(context, tabsRouter),
          );
        },
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(
      BuildContext context, TabsRouter tabsRouter) {
    return BottomNavigationBar(
      onTap: tabsRouter.setActiveIndex,
      currentIndex: tabsRouter.activeIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.plus_one),
          label: 'Counter',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.engineering),
          label: 'Generator',
        ),
      ],
    );
  }
}
