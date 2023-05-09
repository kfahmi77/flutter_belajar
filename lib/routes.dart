import 'package:flutter/material.dart';
import 'package:flutter_belajar/module/coba/coba.dart';
import 'package:flutter_belajar/module/firebase/auth/home.dart';
import 'package:flutter_belajar/module/firebase/crud_firebase/home_crud_firebase.dart';
import 'package:flutter_belajar/module/http/http.dart';
import 'package:go_router/go_router.dart';

import 'module/about/about.dart';
import 'module/firebase/auth/auth_firebase.dart';
import 'module/firebase/crud_firebase/add_firebase.dart';
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
          pageBuilder: (context, state) =>
              const MaterialPage<MaterialPageRoute>(
            child: CobaWidget(),
          ),
        ),
        GoRoute(
            path: 'auth-firebase',
            builder: (BuildContext context, GoRouterState state) {
              return const AuthFirebaseWidget();
            },
            routes: <RouteBase>[]),
        GoRoute(
          path: 'home-auth',
          pageBuilder: (context, state) =>
              const MaterialPage<MaterialPageRoute>(
            child: HomeAuthWidget(),
          ),
        ),
        GoRoute(
          path: 'crud-firebase',
          pageBuilder: (context, state) =>
              const MaterialPage<MaterialPageRoute>(
            child: DataListScreen(),
          ),
        ),
        GoRoute(
          path: 'crud-add-firebase',
          pageBuilder: (context, state) =>
              const MaterialPage<MaterialPageRoute>(
            child: AddCrudFirebase(),
          ),
        ),
      ],
    ),
  ],
);
