library zzy_type_conversion;

import 'dart:convert';

import 'package:flutter/foundation.dart';

/// A Calculator.
class ZzyTypeConversion {
  static String dynamicToString(dynamic value) {
    if (value == null||value=="null") {
      return '';
    }
    return value.toString();
  }

  static double dynamicToDouble(dynamic value) {
    return double.tryParse(value.toString()) ?? 0.0;
  }

  static int dynamicToInt(dynamic value) {
    double doubleValue = double.tryParse(value.toString()) ?? 0.0;
    return doubleValue.toInt();
  }

  static List? dynamicToList(dynamic value) {
    if (value is List) {
      return value;
    } else if (value is String) {
      try {
        var decodedValue = jsonDecode(value);
        if (decodedValue is List) {
          return decodedValue;
        }
      } catch (e) {
        debugPrint("jsonDecode过程出错,该类型不可转为List");
      }
    }
    return null;
  }

  static Map? dynamicToMap(dynamic value) {
    if (value is Map) {
      return value;
    } else if (value is String) {

      try {
        var decodedValue = jsonDecode(value);
        if (decodedValue is Map) {
          return decodedValue;
        }
      } catch (e) {
        debugPrint("jsonDecode过程出错，该类型不可转为Map");
      }
    }
    return null;
  }
}
