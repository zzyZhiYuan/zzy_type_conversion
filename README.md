## 简介

这个package里封装了一些基本类型的转化方法， 无论你输入何种类型的参数，都会得到你期望的类型。
我的设想是以后工作中用到的小工具，都逐渐的添加进来，方便调用。

## 摘要

```dart

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

```

## 用法


```dart

ZzyTypeConversion.dynamicToList();

ZzyTypeConversion.dynamicToString();

ZzyTypeConversion.dynamicToInt();

ZzyTypeConversion.dynamicToDouble();

//......

```