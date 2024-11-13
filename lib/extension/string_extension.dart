extension StringExtension on String {
  String removeNamePrefix() {
    return replaceFirst(RegExp(r'^Name.\s*'), '');
  }
}
