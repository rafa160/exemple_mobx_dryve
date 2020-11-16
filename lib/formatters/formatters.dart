import "package:intl/intl.dart";

class Formatters {
  final f =  NumberFormat("##.000");

  String format(num n) {
    final s = f.format(n);
    return s.endsWith('00') ? s.substring(0, s.length - 3) : s;
  }

}