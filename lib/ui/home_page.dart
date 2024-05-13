import 'package:flutter/material.dart';
import 'package:monie_point_ui/ui/widgets/custom_appbar.dart';
import 'package:monie_point_ui/ui/widgets/custom_grid_view.dart';
import 'package:monie_point_ui/ui/widgets/offers_row.dart';
import 'package:monie_point_ui/ui/widgets/welcome_text.dart';

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
            Colors.orange.shade200,
            Colors.white,
          ],
        ),
      ),
      child: const Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppbar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  WelcomeText(),
                  SizedBox(height: 20),
                  OffersRow(),
                  SizedBox(height: 20),
                  CustomGridView()
                ],
              ),
            ),
          )),
    );
  }
}
