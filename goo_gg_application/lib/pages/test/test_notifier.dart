import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_base_template/river_pod/river_notifier.dart';
import 'package:goo_gg_application/service/native_calculate_service.dart';
import 'package:goo_opengl_plugin/goo_opengl_plugin.dart';

class TestViewModel {
  final num nativeResult;
  final int batteryPercent;
  final int textureId;
  final double radius;
  CalculateModel calculateModel;

  TestViewModel({
    this.radius = 0,
    this.nativeResult = 0,
    this.textureId = -1,
    this.batteryPercent = -1,
    required this.calculateModel,
  });

  TestViewModel copyWith({
    double? radius,
    double? nativeResult,
    int? batteryPercent,
    int? textureId,
    CalculateModel? model,
  }) => TestViewModel(
    radius: radius ?? this.radius,
    textureId: textureId ?? this.textureId,
    nativeResult: nativeResult ?? this.nativeResult,
    batteryPercent: batteryPercent ?? this.batteryPercent,
    calculateModel: model ?? calculateModel,
  );
}

class TestNotifier extends RiverNotifier<TestViewModel> {
  TestNotifier(super.state);

  final numbers = ['1','2','3', '/', '4','5','6', '*', '7','8','9', '-', '0','','=', '+'];

  CalculateModel model = CalculateModel();

  final openGlPlugin = GooOpenglPlugin();

  @override
  void onInit() async {
    initOpenglPlugin();
    print('KBG test : ${await openGlPlugin.getPlatformVersion()}');
  }

  Future<void> initOpenglPlugin() async {
    // Load the image from the embedded assets
    // final bytes = await rootBundle.load('assets/images/bgImg/matterhorn.jpg');
    // final id = await openGlPlugin.initialize(bytes, 300, 400);
    // if (id == null) {
    //   print('KBG id == null');
    //   return;
    // }
    // state = state.copyWith(textureId: id);
    const imageProvider = AssetImage('assets/images/bgImg/aatrox.jpeg');
    var stream = imageProvider.resolve(ImageConfiguration.empty);

    // create a promise that will be resolved once the image is loaded
    final Completer<ImageInfo> completer = Completer<ImageInfo>();
    var listener = ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info);
    });

    // listen to the image loaded event
    stream.addListener(listener);

    // wait for the image to be loaded
    final imageInfo = await completer.future;

    // create the filter controller
    if (mounted) {
      await initFilterController(imageInfo);
    }

    // This is important to release memory within the image stream
    stream.removeListener(listener);
  }

  initFilterController(ImageInfo imageInfo) async {
    // Convert the image bytes to raw rgba
    final rgba = await imageInfo.image.toByteData(format: ImageByteFormat.rawRgba);

    // Initialize the filter controller
    await openGlPlugin.initialize(
        rgba!,
        imageInfo.image.width,
        imageInfo.image.height
    );
    await openGlPlugin.draw(0.0);
    // if (id == null) {
    //   print('KBG id == null');
    //   return;
    // }
    state = state.copyWith(textureId: openGlPlugin.textureId);
  }

  void setModelsByValue(String value) {
    if (value.isEmpty) {
      _reset();
      return;
    }

    final num = int.tryParse(value);
    if (num == null) {
      if (value == '=') {
        _calculateModel();
      } else {
        model.type = CalculationType.values.firstWhere((e) => e.value == value);
      }
    } else {
      if (model.x != null) {
        model.y = num;
      } else {
        model.x = num;
      }
    }
    print('KBG model : ${model.toString()}');
  }

  void _calculateModel() {
    if (!model.isNotEmpty) return;
    final x = model.x!;
    final y = model.y!;
    final type = model.type!;
    final nativeResult = switch (type) {
      CalculationType.plus => NativeCalculateService.instance.add(x, y),
      CalculationType.minus => NativeCalculateService.instance.minus(x, y),
      CalculationType.multiply => NativeCalculateService.instance.multiply(x, y),
      CalculationType.divide => NativeCalculateService.instance.divide(x, y),
    };
    print('KBG result : $nativeResult');
    state = state.copyWith(
      model: model,
      nativeResult: nativeResult.toDouble(),
    );
  }

  void _reset() {
    model.reset();
    state = state.copyWith(
        model: model,
        nativeResult: 0
    );
  }

  void getBatteryLevel() async {
    // final batteryPercent = await _nativePlaygroundPlugin.getBatteryPercent();
    // state = state.copyWith(
    //   batteryPercent: batteryPercent,
    // );
  }

  void changeRadius(double value) {
    state = state.copyWith(radius: value);
  }
}