import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/constants/my_app_icons.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    super.key,
    required this.imageUrl,
    this.imgWidth,
    this.imgHeight,
    this.boxFit,
  });

  final String imageUrl;
  final double? imgWidth;
  final double? imgHeight;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: imgWidth ?? size.width * 0.2,
      height: imgHeight ?? size.width * 0.3,
      fit: boxFit ?? BoxFit.cover,
      errorWidget:(context, url, error) => const Icon(
        MyAppIcons.error,
        color: Colors.red,
        
      ),
    );
  }
}
