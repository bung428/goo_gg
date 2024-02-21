import 'dart:ffi';
import 'dart:io';

class CalculateModel {
  int? x;
  int? y;
  CalculationType? type;

  CalculateModel({this.x, this.y, this.type});

  bool get isNotEmpty => x != null && y != null && type != null;

  @override
  String toString() => 'x : $x, y : $y, type : $type';

  void reset() {
    x = null;
    y = null;
    type = null;
  }
}

enum CalculationType {
  plus('+'),
  minus('-'),
  multiply('*'),
  divide('/'),
  ;

  final String value;
  const CalculationType(this.value);
}

class NativeCalculateService {
  static final NativeCalculateService instance = NativeCalculateService._();

  NativeCalculateService._();

  late DynamicLibrary nativeLibrary;

  void init() {
    nativeLibrary = Platform.isAndroid
        ? DynamicLibrary.open("libnative_library.so")
        : DynamicLibrary.process();
  }

  int add(int x, int y) {
    final int Function(int x, int y) nativeAddFunc = nativeLibrary
        .lookupFunction<Int32 Function(Int32, Int32), int Function(int, int)>("native_add");

    return nativeAddFunc(x, y);
  }

  int minus(int x, int y) {
    final int Function(int x, int y) nativeMinusFunc =
    nativeLibrary
        .lookupFunction<Int32 Function(Int32, Int32), int Function(int, int)>(
        "native_minus");

    return nativeMinusFunc(x, y);
  }

  int multiply(int x, int y) {
    final int Function(int x, int y) nativeMultiplyFunc =
    nativeLibrary
        .lookupFunction<Int32 Function(Int32, Int32), int Function(int, int)>(
        "native_multiply");

    return nativeMultiplyFunc(x, y);
  }

  double divide(int x, int y) {
    final double Function(int x, int y) nativeDivideFunc =
    nativeLibrary
        .lookupFunction<Double Function(Int32, Int32), double Function(int, int)>(
        "native_divide");

    return nativeDivideFunc(x, y);
  }
}