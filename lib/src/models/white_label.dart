import 'dart:convert';

import 'package:easywear_models/easywear_models.dart';

class WhiteLabel {
  String? solutionName;
  ImageId? logoLightBackgroundImageId;
  ImageId? logoDarkBackgroundImageId;
  ImageId? faviconImageId;
  String? primaryColor;
  String? secondaryColor;
  String? tertiaryColor;

  WhiteLabel({
    required this.logoLightBackgroundImageId,
    required this.logoDarkBackgroundImageId,
    required this.faviconImageId,
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.solutionName,
  });

  WhiteLabel.fromJson(Map<String, dynamic> json)
      : solutionName = json["solutionName"],
        logoLightBackgroundImageId = json["logoLightBackgroundImageId"],
        logoDarkBackgroundImageId = json["logoDarkBackgroundImageId"],
        faviconImageId = json["faviconImageId"],
        primaryColor = json["primaryColor"],
        secondaryColor = json["secondaryColor"],
        tertiaryColor = json["tertiaryColor"];

  Map<String, dynamic> toJson() => {
        "solutionName": solutionName,
        "logoLightBackgroundImageId": logoLightBackgroundImageId,
        "logoDarkBackgroundImageId": logoDarkBackgroundImageId,
        "faviconImageId": faviconImageId,
        "primaryColor": primaryColor,
        "secondaryColor": secondaryColor,
        "tertiaryColor": tertiaryColor,
      };

  @override
  String toString() => jsonEncode(this);

  String getSolutionName() => solutionName ?? _defaultSolutionName;

  String getLogoLightBackgroundImageId() => logoLightBackgroundImageId ?? _defaultLogoLightBackgroundImageId;

  String getLogoDarkBackgroundImageId() => logoDarkBackgroundImageId ?? _defaultLogoDarkBackground;

  String getFaviconImageId() => faviconImageId ?? _defaultFaviconImageId;

  String getPrimaryColor() => primaryColor ?? _defaultPrimaryColor;

  String getSecondaryColor() => secondaryColor ?? _defaultSecondaryColor;

  String getTertiaryColor() => tertiaryColor ?? _defaultTertiaryColor;

  static const String _defaultSolutionName = "EasyWear";
  static const String _defaultLogoLightBackgroundImageId = "d9a74ceefd8eabf8884f6c8b9de49028462e6f8a8eeb3f878086b81905ec87a1.png";
  static const String _defaultLogoDarkBackground = "bcd4f05924ca5d3fa547683a398eb13b6482ac75238b8d6104dedb7896c7c805.png";
  static const String _defaultFaviconImageId = "44f0eca8d6071f86405a87bbbedb06405b240315ebc75e132b6c9191bbdd4caf.png";
  static const String _defaultPrimaryColor = "FF213449";
  static const String _defaultSecondaryColor = "FF5883F2";
  static const String _defaultTertiaryColor = "FFEFF5F8";

  WhiteLabel.null_()
      : solutionName = null,
        logoDarkBackgroundImageId = null,
        faviconImageId = null,
        primaryColor = null,
        secondaryColor = null,
        tertiaryColor = null,
        logoLightBackgroundImageId = null;
}
