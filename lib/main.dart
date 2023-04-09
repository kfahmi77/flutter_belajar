import 'package:flutter/material.dart';
import 'package:flutter_belajar/common/app_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'routes.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
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
