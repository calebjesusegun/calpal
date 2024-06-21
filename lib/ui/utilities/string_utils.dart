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

import 'package:intl/intl.dart';

import '../../app/app.logger.dart';

final class StringUtil {
  final _logger = getLogger('StringUtil');

  static bool isEmpty(String? s) {
    return s == null || s.isEmpty;
  }

  static bool isNotEmpty(String? s) {
    return s != null && s.isNotEmpty;
  }

  // Method to get the username initials
  static String getInitials(String? initials) {
    return initials!.isNotEmpty
        ? initials
        .replaceAll(RegExp('  +'), ' ')
        .trim()
        .split(' ')
        .map((l) => l[0])
        .take(2)
        .join()
        : '';
  }

}