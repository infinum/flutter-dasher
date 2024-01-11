/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/splash_center_logo.png
  AssetGenImage get splashCenterLogo =>
      const AssetGenImage('assets/png/splash_center_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [splashCenterLogo];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/button_new_tweet.svg
  SvgGenImage get buttonNewTweet =>
      const SvgGenImage('assets/svg/button_new_tweet.svg');

  /// File path: assets/svg/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/svg/logo.svg');

  /// File path: assets/svg/navigation_bell.svg
  SvgGenImage get navigationBell =>
      const SvgGenImage('assets/svg/navigation_bell.svg');

  /// File path: assets/svg/navigation_home.svg
  SvgGenImage get navigationHome =>
      const SvgGenImage('assets/svg/navigation_home.svg');

  /// File path: assets/svg/navigation_mail.svg
  SvgGenImage get navigationMail =>
      const SvgGenImage('assets/svg/navigation_mail.svg');

  /// File path: assets/svg/navigation_search.svg
  SvgGenImage get navigationSearch =>
      const SvgGenImage('assets/svg/navigation_search.svg');

  /// File path: assets/svg/tweet_comment.svg
  SvgGenImage get tweetComment =>
      const SvgGenImage('assets/svg/tweet_comment.svg');

  /// File path: assets/svg/tweet_like.svg
  SvgGenImage get tweetLike => const SvgGenImage('assets/svg/tweet_like.svg');

  /// File path: assets/svg/tweet_retweet.svg
  SvgGenImage get tweetRetweet =>
      const SvgGenImage('assets/svg/tweet_retweet.svg');

  /// File path: assets/svg/tweet_share.svg
  SvgGenImage get tweetShare => const SvgGenImage('assets/svg/tweet_share.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        buttonNewTweet,
        logo,
        navigationBell,
        navigationHome,
        navigationMail,
        navigationSearch,
        tweetComment,
        tweetLike,
        tweetRetweet,
        tweetShare
      ];
}

class Assets {
  Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
