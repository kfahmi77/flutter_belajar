import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'module/about/about.dart';
import 'module/home/home_page.dart';
import 'module/settings/settings.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage<MaterialPageRoute>(
        child: HomePage(),
      ),
      routes: [
        GoRoute(
          path: 'settings',
          pageBuilder: (context, state) =>
              const MaterialPage<MaterialPageRoute>(
            child: SettingsPage(),
          ),
        ),
        GoRoute(
          path: 'about',
          pageBuilder: (context, state) =>
              const MaterialPage<MaterialPageRoute>(
            child: AboutPage(),
          ),
        ),
      ],
    ),
  ],
);
