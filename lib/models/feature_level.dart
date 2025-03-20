enum FeatureLevel { free, basic, premium, enterprise }

extension FeatureLevelExtension on FeatureLevel {
  String string() => toString().split(".").last;

  static FeatureLevel fromString(String featureLevel) =>
      FeatureLevel.values.firstWhere((e) => e.string() == featureLevel);

  String get uiText => switch (this) {
    FeatureLevel.free => "Free",
    FeatureLevel.basic => "Basic",
    FeatureLevel.premium => "Premium",
    FeatureLevel.enterprise => "Enterprise",
  };
}
