import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_belajar/common/app_drawer.dart';

import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
