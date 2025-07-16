class Nullable<T> {
  final T? value;

  const Nullable(this.value);

  @override
  String toString() => "Nullable($value)";
}
