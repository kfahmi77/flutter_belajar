import 'package:flutter/material.dart';
import 'package:flutter_belajar/common/appbar.dart';

import '../../main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarSafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const NavigationAppDrawer(),
        body: const Center(
          child: Text('This is the settings page'),
        ),
      ),
    );
  }
}
