import 'package:flutter/material.dart';
import 'package:flutter_belajar/common/appbar.dart';

import '../../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppbarSafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        drawer: const NavigationAppDrawer(),
        body: const Center(child: Text('This is Home Page')),
      ),
    );
  }
}
