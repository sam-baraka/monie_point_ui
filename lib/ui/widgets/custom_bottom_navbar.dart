import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monie_point_ui/providers/bottom_nav_provider.dart';
import 'package:monie_point_ui/resources/colors.dart';


class CustomBottomNavbar extends ConsumerStatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  _CustomBottomNavbarState createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends ConsumerState<CustomBottomNavbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start position
      end: Offset.zero, // End position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    // Start the animation after a delay
    Future.delayed(const Duration(milliseconds: 500), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context,) {
    return SlideTransition(
      position: _animation,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: icons.map((e) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: BottomIconButton(
                  icon: e,
                  isSelected: icons.indexOf(e) ==
                      ref.watch(customBottomNavigationBarProvider),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}


List<IconData> icons = [
  Icons.search,
  Icons.message,
  Icons.home,
  Icons.favorite,
  Icons.person
];

class BottomIconButton extends ConsumerWidget {
  final IconData icon;
  final bool isSelected;
  const BottomIconButton(
      {super.key, required this.icon, required this.isSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CircleAvatar(
      backgroundColor: isSelected ? AppColors.orange : Colors.black,
      radius: isSelected ? 30 : 24,
      child: GestureDetector(
        onTap: () => ref
            .read(customBottomNavigationBarProvider.notifier)
            .changeIndex(icons.indexOf(icon)),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
