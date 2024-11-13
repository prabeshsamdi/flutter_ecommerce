import 'package:html/parser.dart' show parse;

String htmlToPlainText(String htmlString) {
  final document = parse(htmlString);
  String parsedString = parse(document.body!.text).documentElement!.text;
  return parsedString;
}