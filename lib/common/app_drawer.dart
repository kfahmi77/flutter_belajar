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
              context.go('/');
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
          const ExpansionTile(
            title: Text('Menu'),
            children: [
              ListTile(
                title: Text('data'),
              )
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
        ],
      ),
    );
  }
}
