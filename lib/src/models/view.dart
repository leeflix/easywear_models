enum View { admin, user, supplier }

extension ViewExt on View {
  String get string => toString().split('.').last;

  static View fromString(String s) =>
      View.values.firstWhere((e) => e.string == s);
}
