import 'package:flutter/material.dart';
import 'package:monie_point_ui/resources/colors.dart';
import 'package:monie_point_ui/ui/home_page.dart';

void main() {
  runApp(const RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          AppColors.orange.value,
          const <int, Color>{
            50: Color(0xFFFFF3E0),
            100: Color(0xFFFFE0B2),
            200: Color(0xFFFFCC80),
            300: Color(0xFFFFB74D),
            400: Color(0xFFFFA726),
            500: Color(0xFFFF9800),
            600: Color(0xFFFB8C00),
            700: Color(0xFFF57C00),
            800: Color(0xFFEF6C00),
            900: Color(0xFFE65100),
          },
        ),
      ),
      home: const HomePage(),
    );
  }
}
