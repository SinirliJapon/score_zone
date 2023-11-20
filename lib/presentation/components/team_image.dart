import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildImage extends StatelessWidget {
  final String url;

  const BuildImage({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    if (url.endsWith('.svg')) {
      return SvgPicture.network(
        url,
        width: 35,
        placeholderBuilder: (context) {
          return const Icon(Icons.sports_soccer_outlined, size: 35);
        },
      );
    } else {
      return Image.network(
        url,
        width: 35,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.sports_soccer_outlined, size: 35);
        },
      );
    }
  }
}
