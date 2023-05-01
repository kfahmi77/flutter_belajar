import 'package:flutter/material.dart';
import 'package:flutter_belajar/module/coba/coba.dart';
import 'package:flutter_belajar/module/http/http.dart';
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
          path: 'home',
          pageBuilder: (context, state) =>
              const MaterialPage<MaterialPageRoute>(
            child: HomePage(),
          ),
        ),
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
        GoRoute(
          path: 'http',
          pageBuilder: (context, state) =>
              const MaterialPage<MaterialPageRoute>(
            child: HttpWidget(),
          ),
        ),
        GoRoute(
          path: 'coba',
          pageBuilder: (context, state) => MaterialPage<MaterialPageRoute>(
            child: CobaWidget(),
          ),
        ),
      ],
    ),
  ],
);
