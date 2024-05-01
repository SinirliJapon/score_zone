import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jovial_svg/jovial_svg.dart';

class BuildImage extends StatelessWidget {
  final String url;
  final double width;
  final ScalableImageCache cache = ScalableImageCache(size: 100);

  BuildImage({
    Key? key,
    required this.url,
    this.width = 35,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url.toLowerCase().endsWith('.svg') ? _buildSvgImage() : _buildNetworkImage();
  }

  Widget _buildSvgImage() {
    
    return SizedBox(
      height: width,
      width: width,
      child: ScalableImageWidget.fromSISource(
        cache: cache,
        fit: BoxFit.cover,
        si: ScalableImageSource.fromSvgHttpUrl(Uri.parse(url)),
      ),
    );
  }

  Widget _buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: width,
      placeholder: (BuildContext context, String url) {
        return _buildPlaceholder();
      },
      errorWidget: (BuildContext context, String url, dynamic error) {
        return _buildErrorWidget();
      },
    );
  }

  Widget _buildPlaceholder() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.grey,
        strokeWidth: 2.0,
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Icon(
        Icons.error,
        size: width,
      ),
    );
  }
}
