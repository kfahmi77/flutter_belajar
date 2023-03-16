import 'package:flutter/material.dart';
import 'package:flutter_belajar/common/appbar.dart';
import 'package:flutter_belajar/common/widget/about_dialog_widget.dart';
import 'package:flutter_belajar/common/widget/alert_dialog_widget.dart';
import 'package:flutter_belajar/common/widget/animation/animated_align.dart';
import 'package:flutter_belajar/common/widget/animation/animated_icon.dart';

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
        body: const Center(child: AboutDialogWidget()),
      ),
    );
  }
}
