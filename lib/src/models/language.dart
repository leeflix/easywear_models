enum Language {
  de,
  en,
  fr,
  it,
  es,
  nl,
  ru,
  tr,
  no,
  da,
  sv,
  ar,
  zh,
  th,
  vi,
  cs,
  el,
  uk,
  hr,
  ja,
  pl,
  pt,
  ko,
  ur,
  bg,
  af,
  hi
}

extension LanguageExt on Language {
  String get string => toString().split(".").last;

  static Language fromString(String s) =>
      Language.values.firstWhere((e) => e.string == s);

  String get uiString => switch (this) {
        Language.de => "Deutsch",
        Language.en => "English",
        Language.fr => "Français",
        Language.it => "Italiano",
        Language.es => "Español",
        Language.nl => "Nederlands",
        Language.ru => "Русский",
        Language.tr => "Türkçe",
        Language.no => "Norsk",
        Language.da => "Dansk",
        Language.sv => "Svenska",
        Language.ar => "العربية",
        Language.zh => "中文",
        Language.th => "ไทย",
        Language.vi => "Tiếng Việt",
        Language.cs => "Čeština",
        Language.el => "Ελληνικά",
        Language.uk => "Українська",
        Language.hr => "Hrvatski",
        Language.ja => "日本語",
        Language.pl => "Polski",
        Language.pt => "Português",
        Language.ko => "한국어",
        Language.ur => "اردو",
        Language.bg => "български",
        Language.af => "Afrikaans",
        Language.hi => "हिन्दी",
      };
}
