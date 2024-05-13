import 'package:flutter_riverpod/flutter_riverpod.dart';

final customBottomNavigationBarProvider =
    StateNotifierProvider<CustomBottomNavigationBar, int>((ref) {
  return CustomBottomNavigationBar();
});

class CustomBottomNavigationBar extends StateNotifier<int> {
  CustomBottomNavigationBar() : super(2);

  void changeIndex(int index) {
    state = index;
  }
}
