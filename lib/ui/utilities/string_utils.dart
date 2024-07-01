/*
------------------------------------------------------------------------
| STRING UTIL CLASS              | For: Oaks Intelligence               |
| ----------------------------------------------------------------------
| By: Caleb Jesusegun            | Date: 17 - Apr - 2024                |
| ----------------------------------------------------------------------
| Modified by:                   | Comments:                            |
------------------------------------------------------------------------
NB:
*/
import 'dart:math';

final class StringUtil {
  static bool isEmpty(String? s) {
    return s == null || s.isEmpty;
  }

  static bool isNotEmpty(String? s) {
    return s != null && s.isNotEmpty;
  }

  /// Format File Size
  static String getFileSizeString({required int bytes, int decimals = 0}) {
    if (bytes <= 0) return "0 Bytes";
    const suffixes = [" Bytes", " KB", " MB", " GB", " TB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }
}
