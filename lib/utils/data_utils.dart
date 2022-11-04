import 'package:intl/intl.dart';

String formatData(String data) {
  final date = DateTime.parse(data);
  final formatter = DateFormat('dd/MM/yyyy');
  final formatted = formatter.format(date);
  return formatted;
}
