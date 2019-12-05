import 'package:intl/intl.dart';

String getDateFormatByUnix(int time, String format) {
  final formatDate = DateFormat(format);
  print("Helpers/utils/getDateFormatByUnix -> " + time.toString());
  final date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
  return formatDate.format(date).toString();
}
