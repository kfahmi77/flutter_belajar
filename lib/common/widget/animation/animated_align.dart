import 'package:flutter/material.dart';

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({super.key});

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: Center(
        child: Container(
          width: double.infinity,
          height: 250,
          color: Colors.blue,
          child: AnimatedAlign(
            alignment: _selected ? Alignment.topRight : Alignment.bottomLeft,
            duration: const Duration(seconds: 1),
            curve: Curves.bounceIn,
            child: const FlutterLogo(
              size: 56,
            ),
          ),
        ),
      ),
    );
  }
}
