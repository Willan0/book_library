import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant/dimen.dart';

class EasyImage extends StatelessWidget {
  const EasyImage({Key? key, required this.imgUrl, required this.height,this.width = kWh150x}) : super(key: key);

  final String imgUrl;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imgUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
    );
  }
}
