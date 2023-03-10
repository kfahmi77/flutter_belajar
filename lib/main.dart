import 'package:flutter/material.dart';
import 'package:flutter_belajar/common/app_drawer.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Belajar Flutter',
      routerConfig: router,
    );
  }
}

class NavigationAppDrawer extends StatelessWidget {
  const NavigationAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppDrawer();
  }
}
