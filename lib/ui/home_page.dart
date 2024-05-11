import 'package:flutter/material.dart';
import 'package:monie_point_ui/ui/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.orange.shade100,
            Colors.white,
          ],
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppbar(),
        body: Center(
          child: Text('Welcome to Real Estate App'),
        ),
      ),
    );
  }
}
