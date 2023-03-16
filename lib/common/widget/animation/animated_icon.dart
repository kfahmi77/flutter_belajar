import 'package:flutter/material.dart';

class AnimatedIconWidget extends StatefulWidget {
  const AnimatedIconWidget({super.key});

  @override
  State<AnimatedIconWidget> createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with TickerProviderStateMixin {
  bool _play = false;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (_play == false) {
            _animationController.forward();
            _play = true;
          } else {
            _animationController.reverse();
            _play = false;
          }
        },
        child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: _animationController,
          size: 36,
        ),
      ),
    );
  }
}
