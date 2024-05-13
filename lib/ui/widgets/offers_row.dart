import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_ui/resources/colors.dart';

class OffersRow extends StatefulWidget {
  const OffersRow({super.key});

  @override
  State<OffersRow> createState() => _OffersRowState();
}

class _OffersRowState extends State<OffersRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _numberAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _numberAnimation = Tween(begin: 0.0, end: 2212.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) => Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          ),
          child: CircleAvatar(
            backgroundColor: AppColors.orange,
            radius: MediaQuery.of(context).size.width * 0.25 - 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedDefaultTextStyle(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                  duration: const Duration(seconds: 2),
                  child: const Text('BUY'),
                ),
                const SizedBox(height: 10),
                AnimatedDefaultTextStyle(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  duration: const Duration(seconds: 2),
                  child: Text(
                      '${_numberAnimation.value.toInt()}'), // Displaying the animated number
                ),
                Text(
                  'Offers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) => Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          ),
          child: Container(
            height: MediaQuery.of(context).size.width * 0.5 - 20,
            padding: const EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width * 0.5 - 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'RENT',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14.sp,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '2212',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Offers',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
