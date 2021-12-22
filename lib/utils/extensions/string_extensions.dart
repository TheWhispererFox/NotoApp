extension StringExtension on String {
  String toSnakecase() {
    final exp = RegExp('(?<=[a-z])[A-Z]');
    final replaceAllMapped =
        this.replaceAllMapped(exp, (Match m) => '_${m.group(0)}');
    return replaceAllMapped.toLowerCase();
  }
}
