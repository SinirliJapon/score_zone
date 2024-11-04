import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:score_zone/utils/colors.dart';

class BuildImage extends StatelessWidget {
  final String url;
  final double width;

  static final ScalableImageCache cache = ScalableImageCache(size: 500);

  const BuildImage({
    Key? key,
    required this.url,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String finalUrl = _getFinalUrl(url);
    return finalUrl.toLowerCase().endsWith('.svg') ? _buildSvgImage(finalUrl) : _buildNetworkImage(finalUrl);
  }

  Widget _buildSvgImage(String finalUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: SizedBox(
        height: width,
        width: width,
        child: ScalableImageWidget.fromSISource(
          cache: cache,
          clip: true,
          reload: true,
          isComplex: true,
          fit: BoxFit.cover,
          si: ScalableImageSource.fromSvgHttpUrl(Uri.parse(finalUrl)),
          switcher: (BuildContext context, Widget? child) => _buildSwitcher(child),
          onLoading: (BuildContext context) => _buildPlaceholder(),
          onError: (BuildContext context) => _buildErrorWidget(),
        ),
      ),
    );
  }

  Widget _buildNetworkImage(String finalUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: SizedBox(
        width: width,
        height: width,
        child: CachedNetworkImage(
          imageUrl: finalUrl,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 500),
          placeholder: (BuildContext context, String url) => _buildPlaceholder(),
          errorWidget: (BuildContext context, String url, dynamic error) => _buildErrorWidget(),
        ),
      ),
    );
  }

  /// Maps original URLs to fallback URLs for problematic images.
  String _getFinalUrl(String originalUrl) {
    const urlMap = {
      "https://crests.football-data.org/764.svg":
          "https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/486px-Flag_of_Brazil.svg.png",
      "https://crests.football-data.org/ge.svg":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Flag_of_Georgia.svg/510px-Flag_of_Georgia.svg.png",
      "https://crests.football-data.org/CLI.svg": "https://brandlogos.net/wp-content/uploads/2022/11/copa_libertadores-logo_brandlogos.net_fh1mg.png",
    };
    return urlMap[originalUrl] ?? originalUrl;
  }

  Widget _buildSwitcher(Widget? child) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: child,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, filterQuality: FilterQuality.high, child: child);
      },
      layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
        return SizedBox(
          width: width,
          height: width,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            clipBehavior: Clip.hardEdge,
            children: <Widget>[
              if (currentChild != null) currentChild,
              ...previousChildren,
            ],
          ),
        );
      },
    );
  }

  Widget _buildPlaceholder() {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        strokeCap: StrokeCap.round,
        strokeAlign: BorderSide.strokeAlignCenter,
        valueColor: AlwaysStoppedAnimation<Color>(primaryText),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Icon(
        Icons.error,
        size: width,
        color: Colors.red,
      ),
    );
  }
}
