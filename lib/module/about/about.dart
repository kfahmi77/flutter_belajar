import 'package:flutter/material.dart';
import 'package:flutter_belajar/common/appbar.dart';
import 'package:flutter_belajar/common/widget/about_dialog_widget.dart';
import 'package:flutter_belajar/common/widget/alert_dialog_widget.dart';
import 'package:flutter_belajar/common/widget/animation/animated_align.dart';
import 'package:flutter_belajar/common/widget/animation/animated_icon.dart';
import 'package:flutter_belajar/common/widget/update_dialog_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const CustomDialog());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return AppbarSafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('About'),
                centerTitle: true,
              ),
              drawer: const NavigationAppDrawer(),
              body: const Center(
                child: Text('This is the about  page'),
              ),
            ),
          );
        });
  }
}
