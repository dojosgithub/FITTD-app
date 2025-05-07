import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class FittedImageProvider extends StatelessWidget {
  final String imagePath;
  final AppImageType imageType;
  final Size? imageSize;
  final BoxFit? boxFit;
  final AppImageType? childImageType;
  final ColorFilter? colorFilter;
  final BorderRadius? borderRadius;

  const FittedImageProvider._({
    required this.imagePath,
    required this.imageType,
    this.imageSize,
    this.childImageType,
    this.boxFit,
    this.colorFilter,
    this.borderRadius,
  });

  factory FittedImageProvider.networkSvg({
    required String imagePath,
    Size? imageSize,
  }) {
    return FittedImageProvider._(
      imagePath: imagePath,
      imageType: AppImageType.svgNetwork,
      imageSize: imageSize,
    );
  }

  factory FittedImageProvider.localSvg({
    required String imagePath,
    Size? imageSize,
    ColorFilter? colorFilter,
    BoxFit? boxFit,
  }) {
    return FittedImageProvider._(
      imagePath: imagePath,
      imageType: AppImageType.svgLocal,
      imageSize: imageSize,
      colorFilter: colorFilter,
      boxFit: boxFit,
    );
  }

  factory FittedImageProvider.localAsset({
    required String imagePath,
    Size? imageSize,
    BoxFit? boxFit,
  }) {
    return FittedImageProvider._(
      imagePath: imagePath,
      imageType: AppImageType.local,
      imageSize: imageSize,
      boxFit: boxFit,
    );
  }

  factory FittedImageProvider.network({
    required String imagePath,
    Size? imageSize,
    BoxFit? boxFit,
  }) {
    return FittedImageProvider._(
      imagePath: imagePath,
      imageType: AppImageType.network,
      imageSize: imageSize,
      boxFit: boxFit,
    );
  }

  factory FittedImageProvider.circularNetwork({
    required String imagePath,
    Size? imageSize,
    BoxFit? boxFit,
  }) {
    return FittedImageProvider._(
      imagePath: imagePath,
      imageType: AppImageType.circularNetwork,
      imageSize: imageSize,
      boxFit: boxFit,
    );
  }

  factory FittedImageProvider.fileImage({
    required String imagePath,
    Size? imageSize,
    BoxFit? boxFit,
  }) {
    return FittedImageProvider._(
      imagePath: imagePath,
      imageType: AppImageType.file,
      imageSize: imageSize,
      boxFit: boxFit,
    );
  }

  factory FittedImageProvider.roundedRect({
    required String imagePath,
    Size? imageSize,
    required AppImageType childImageType,
    required BorderRadius borderRadius,
    BoxFit? boxFit,
  }) {
    return FittedImageProvider._(
      imagePath: imagePath,
      childImageType: childImageType,
      imageSize: imageSize,
      borderRadius: borderRadius,
      boxFit: boxFit,
      imageType: AppImageType.roundedRect,
    );
  }

  factory FittedImageProvider.circular({
    required String imagePath,
    Size? imageSize,
    required AppImageType childImageType,
    BoxFit? boxFit,
  }) {
    return FittedImageProvider._(
      imagePath: imagePath,
      childImageType: childImageType,
      imageSize: imageSize,
      boxFit: boxFit,
      imageType: AppImageType.circular,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildImage();
  }

  Widget _buildImage() {
    switch (imageType) {
      case AppImageType.network:
        return _networkImage();
      case AppImageType.local:
        return _localImage();
      case AppImageType.file:
        return _fileImage();
      case AppImageType.svgNetwork:
        return _svgNetwork();
      case AppImageType.svgLocal:
        return _svgLocal();
      case AppImageType.circularNetwork:
        return _circularNetworkImage();
      case AppImageType.roundedRect:
        return ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: _getImageWidget(),
        );
      case AppImageType.circular:
        return ClipOval(
          child: _getImageWidget(),
        );
    }
  }

  Widget _networkImage() {
    return CachedNetworkImage(
      imageUrl: imagePath,
      width: imageSize?.width,
      height: imageSize?.height,
      fit: boxFit ?? BoxFit.contain,
      placeholder: (_, __) => _shimmerLoadingPlaceholder(),
      errorWidget: (_, __, ___) => _errorPlaceholder(),
    );
  }

  Widget _localImage() {
    return Image.asset(
      imagePath,
      width: imageSize?.width,
      height: imageSize?.height,
      fit: boxFit ?? BoxFit.contain,
    );
  }

  Widget _fileImage() {
    return Image.file(
      File(imagePath),
      width: imageSize?.width,
      height: imageSize?.height,
      fit: boxFit ?? BoxFit.contain,
    );
  }

  Widget _svgNetwork() {
    return SvgPicture.network(
      imagePath,
      width: imageSize?.width,
      height: imageSize?.height,
      fit: boxFit ?? BoxFit.contain,
    );
  }

  Widget _svgLocal() {
    return SvgPicture.asset(
      imagePath,
      width: imageSize?.width,
      height: imageSize?.height,
      fit: boxFit ?? BoxFit.contain,
      colorFilter: colorFilter,
    );
  }

  Widget _circularNetworkImage() {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imagePath,
        width: imageSize?.width,
        height: imageSize?.height,
        fit: boxFit ?? BoxFit.contain,
        placeholder: (_, __) => _shimmerLoadingPlaceholder(),
        errorWidget: (_, __, ___) => _errorPlaceholder(),
      ),
    );
  }

  Widget _getImageWidget() {
    switch (childImageType) {
      case AppImageType.network:
        return _networkImage();
      case AppImageType.circularNetwork:
        return _networkImage();
      case AppImageType.local:
        return _localImage();
      case AppImageType.file:
        return _fileImage();
      case AppImageType.svgNetwork:
        return _svgNetwork();
      case AppImageType.svgLocal:
        return _svgLocal();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _shimmerLoadingPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        width: imageSize?.width ?? 50,
        height: imageSize?.height ?? 50,
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _errorPlaceholder() {
    return SizedBox(
      width: imageSize?.width ?? 50,
      height: imageSize?.height ?? 50,
      child: const Center(
        child: Icon(Icons.error, color: Colors.red),
      ),
    );
  }
}

enum AppImageType {
  svgLocal,
  svgNetwork,
  network,
  local,
  file,
  circularNetwork,
  roundedRect,
  circular,
}
