import 'package:intl/intl.dart';

String getFormattedDate(DateTime dt, String pattern) =>
    DateFormat(pattern).format(dt);
