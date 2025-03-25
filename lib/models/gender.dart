enum Gender { mrs, mr, diverse, preferNotToSay }

extension GenderExtension on Gender {
  String get string => toString().split(".").last;

  static Gender fromString(String string) =>
      Gender.values.firstWhere((gender) => gender.string == string);
}