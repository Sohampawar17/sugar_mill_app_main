import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
// ...

class ViewImage extends StatelessWidget {
  final Image image;
  const ViewImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: image.image,
    );
  }
}
