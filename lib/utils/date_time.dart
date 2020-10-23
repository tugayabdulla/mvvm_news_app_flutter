import 'package:intl/intl.dart';

String formatDateForUI(DateTime date)=>  DateFormat('MM/dd/yyy').format(date);
String formatDateForService(DateTime date)=>  DateFormat('MM/dd/yyy').format(date);