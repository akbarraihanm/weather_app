import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const defaultDateFormat = "yyyy-MM-dd HH:mm";

abstract class DateTimeFormatterHelper {
  static String formatTime({
    String dateFormat = defaultDateFormat,
    DateTime? dateTime,
  }) {
    try {
      initializeDateFormatting();
      return DateFormat(dateFormat).format(dateTime!);
    } catch (e) {
      throw Exception('dateTime must not be nul');
    }
  }
}