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

final class StringUtil {
  static bool isEmpty(String? s) {
    return s == null || s.isEmpty;
  }

  static bool isNotEmpty(String? s) {
    return s != null && s.isNotEmpty;
  }
}
