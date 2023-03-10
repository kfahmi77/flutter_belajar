import 'package:flutter/material.dart';

class AppbarSafeArea extends StatelessWidget {
  final Widget child;

  const AppbarSafeArea({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: child);
  }
}
