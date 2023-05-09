import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouter.of(context).location.toString();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            selected: currentRoute == '/',
            selectedTileColor: Colors.blue[100],
            tileColor: currentRoute == '/' ? Colors.blue[100] : null,
            title: const Text('Home'),
            onTap: () {
              context.go('/home');
            },
          ),
          ListTile(
            selected: currentRoute == '/settings',
            selectedTileColor: Colors.blue[100],
            tileColor: currentRoute == '/settings' ? Colors.blue[100] : null,
            title: const Text('Settings'),
            onTap: () {
              context.go('/settings');
            },
          ),
          ExpansionTile(
            title: const Text('Network'),
            children: [
              ListTile(
                  title: const Text('HTTP'),
                  selected: currentRoute == '/http',
                  selectedTileColor: Colors.blue[100],
                  tileColor: currentRoute == '/http' ? Colors.blue[100] : null,
                  onTap: () {
                    GoRouter.of(context).go('/http');
                  })
            ],
          ),
          ListTile(
            selected: currentRoute == '/about',
            selectedTileColor: Colors.blue[100],
            tileColor: currentRoute == '/about' ? Colors.blue[100] : null,
            title: const Text('About'),
            onTap: () {
              GoRouter.of(context).go('/about');
            },
          ),
          ListTile(
            selected: currentRoute == '/coba',
            selectedTileColor: Colors.blue[100],
            tileColor: currentRoute == '/coba' ? Colors.blue[100] : null,
            title: const Text('Coba'),
            onTap: () {
              GoRouter.of(context).go('/coba');
            },
          ),
          ExpansionTile(
            title: const Text('Firebase'),
            children: [
              ListTile(
                selected: currentRoute == '/auth-firebase',
                selectedTileColor: Colors.blue[100],
                tileColor:
                    currentRoute == '/auth-firebase' ? Colors.blue[100] : null,
                title: const Text('Firebase'),
                onTap: () {
                  GoRouter.of(context).go('/auth-firebase');
                },
              ),
              ListTile(
                selected: currentRoute == '/crud-firebase',
                selectedTileColor: Colors.blue[100],
                tileColor:
                    currentRoute == '/crud-firebase' ? Colors.blue[100] : null,
                title: const Text('CRUD Firebase'),
                onTap: () {
                  GoRouter.of(context).go('/crud-firebase');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
