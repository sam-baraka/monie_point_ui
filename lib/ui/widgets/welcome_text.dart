import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_ui/resources/colors.dart';

class WelcomeText extends StatefulWidget {
  const WelcomeText({super.key});

  @override
  WelcomeTextState createState() => WelcomeTextState();
}

class WelcomeTextState extends State<WelcomeText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
      child: Text.rich(
        TextSpan(
          text: 'Hi, Marina\n',
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.grey,
          ),
          children: [
            TextSpan(
              text: 'let\'s select your perfect place',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
