import 'package:flutter/material.dart';
import 'package:flutter_belajar/common/appbar.dart';

import '../../main.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarSafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('About'),
        ),
        drawer: const NavigationAppDrawer(),
        body: const Center(
          child: Text('This is the about page'),
        ),
      ),
    );
  }
}
