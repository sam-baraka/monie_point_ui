import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:monie_point_ui/ui/widgets/custom_grid_tile.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({super.key});

  @override
  CustomGridViewState createState() => CustomGridViewState();
}

class CustomGridViewState extends State<CustomGridView>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.ease,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation!,
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: tiles
            .map((index) => CustomGridTile(
                  imageUrl: index.imageUrl,
                  title: index.title,
                  width: index.width,
                  height: index.height,
                ))
            .toList(),
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}

List<TileContent> tiles = List.generate(
    imageUrls.length,
    (index) => TileContent(
          imageUrl: imageUrls[index],
          title: 'Marina, 25',
          width: index == 0 ? 2 : 1,
          height: 1,
        ));

List<int> dimensions = [1, 2];

List<String> imageUrls = [
  'https://th.bing.com/th/id/OIG1.8P_eYAdZjrksQYHf0XHV?pid=ImgGn',
  'https://th.bing.com/th/id/OIG3.KGwAR_2FObZDA13HLH1e?pid=ImgGn',
  'https://th.bing.com/th/id/OIG3.WDWj_6e0_1pPRbvLUXoc?pid=ImgGn',
  'https://th.bing.com/th/id/OIG2.LzFbK6CPEB5VYX7egMRS?pid=ImgGn',
  'https://th.bing.com/th/id/OIG3.LXoVu9PHmroc0Q.Jg7oD?pid=ImgGn',
  'https://th.bing.com/th/id/OIG3.9Tj01Fq_ZMCM0HjBVkV8?pid=ImgGn',
  'https://th.bing.com/th/id/OIG3.0LhgvhTO_4d_0ux5ABPN?w=1024&h=1024&rs=1&pid=ImgDetMain'
];

class TileContent {
  final String imageUrl;
  final String title;
  final int width;
  final int height;
  const TileContent(
      {required this.imageUrl,
      required this.title,
      required this.width,
      required this.height});
}
