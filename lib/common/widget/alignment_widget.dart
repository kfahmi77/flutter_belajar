import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  const AlignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120.0,
        width: double.infinity,
        color: Colors.blue,
        child: const Align(
          alignment: Alignment.centerRight,
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}
