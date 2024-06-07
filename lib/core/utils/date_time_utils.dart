import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../app_export.dart';

const String dateTimeFormatPattern = 'dd/MM/yyyy';

extension DateTimeExtension on DateTime {
  String toFormattedString() {
    initializeDateFormatting();
    return DateFormat(dateTimeFormatPattern).format(this);
  }

  String toFormattedStringWithTime() {
    initializeDateFormatting();
    return DateFormat('dd/MM/yyyy HH:mm').format(this);
  }

  String toFormattedStringWithTimeAndSeconds() {
    initializeDateFormatting();
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(this);
  }

  String toFormattedStringWithTimeAndSecondsAndMilliseconds() {
    initializeDateFormatting();
    return DateFormat('dd/MM/yyyy HH:mm:ss:SSS').format(this);
  }
}
