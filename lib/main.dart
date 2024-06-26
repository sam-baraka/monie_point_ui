import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_ui/resources/colors.dart';
import 'package:monie_point_ui/ui/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const ProviderScope(child: RealEstateApp()));
}

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(415, 900),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Real Estate App',
            theme: ThemeData(
              textTheme: GoogleFonts.latoTextTheme(),
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
        });
  }
}
