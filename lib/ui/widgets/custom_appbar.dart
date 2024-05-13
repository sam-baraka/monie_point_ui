import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monie_point_ui/providers/bottom_nav_provider.dart';
import 'package:monie_point_ui/resources/colors.dart';

class CustomAppbar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  CustomAppbarState createState() => CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class CustomAppbarState extends ConsumerState<CustomAppbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.ease);
    _animation2 = CurvedAnimation(parent: _controller, curve: Curves.ease);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  ref
                      .read(customBottomNavigationBarProvider.notifier)
                      .changeIndex(0);
                },
                child: SizeTransition(
                  sizeFactor: _animation2,
                  axis: Axis.horizontal,
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 12,
                          color: AppColors.grey,
                        ),
                        Text(
                          'Saint Petersburg',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              ScaleTransition(
                scale: _animation,
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://cdn.dribbble.com/users/7073753/avatars/normal/data?1613551819',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
