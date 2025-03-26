enum Gender { mrs, mr, diverse, preferNotToSay }

extension GenderExt on Gender {
  String get string => toString().split(".").last;

  static Gender fromString(String s) =>
      Gender.values.firstWhere((gender) => gender.string == s);
}
