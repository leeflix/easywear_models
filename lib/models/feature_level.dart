enum FeatureLevel {
  free,
  basic,
  premium,
  enterprise,
}

extension FeatureLevelExt on FeatureLevel {
  String get string => toString().split(".").last;

  static FeatureLevel fromString(String featureLevel) =>
      FeatureLevel.values.firstWhere((e) => e.string == featureLevel);

  String get uiText => {
    FeatureLevel.free: "Free",
    FeatureLevel.basic: "Basic",
    FeatureLevel.premium: "Premium",
    FeatureLevel.enterprise: "Enterprise",
  }[this]!;
}
