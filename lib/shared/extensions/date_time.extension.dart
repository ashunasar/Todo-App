import 'package:date_format/date_format.dart';

extension DateTimeExtension on DateTime {
  String format() {
    return formatDate(this, [d, 'th ', MM, ' ', yyyy]);
  }
}
