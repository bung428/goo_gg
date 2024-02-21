import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:flutter_base_template/river_pod/river_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goo_gg_application/pages/test/data/test_type.dart';
import 'package:goo_gg_application/service/native_calculate_service.dart';

import 'test_notifier.dart';

class TestPage extends RiverProvider<TestNotifier, TestViewModel> {
  final TestType type;

  const TestPage(this.type, {super.key});

  @override
  Widget build(BuildContext context, provider, TestNotifier notifier) {
    final theme = Theme.of(context);
    final body = switch (type) {
      TestType.ffi => _buildCalculateWidget(theme, notifier, provider),
      TestType.opengl => _buildRenderByOpengl(notifier, provider),
      TestType.etc => _buildEtc(),
    };
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
       child: body
      ),
    );
  }

  Column _buildRenderByOpengl(TestNotifier notifier, TestViewModel provider) {
    return Column(children: [
      Expanded(
          child: provider.textureId != -1
              ? AspectRatio(
            aspectRatio: 300 / 400,
            // The flutter Texture widget draws a gpu texture using the texture id we got
            // from the filter native implementation
            child: Texture(
              textureId: provider.textureId,
            ),
          )
              : SizedBox()),
      Row(
        children: [
          const SizedBox(width: 20),
          const Text(
            'Blur',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Expanded(
            child: Slider(
              value: provider.radius,
              min: 0,
              max: 20,
              onChanged: notifier.changeRadius,
            ),
          )
        ],
      ),
    ]);
  }

  ListView _buildCalculateWidget(ThemeData theme, TestNotifier notifier, TestViewModel provider) {
    return ListView(
      padding: const EdgeInsetsApp(vertical: 12, horizontal: 16),
      children: [
        Row(
          children: [
            const Spacer(),
            Text(
              provider.nativeResult == 0 ? '0' : '${provider.nativeResult}',
              textAlign: TextAlign.right,
              style: theme.textTheme.titleLarge?.copyWith(),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          children: notifier.numbers
              .map(
                (e) => InkWell(
                  onTap: () => notifier.setModelsByValue(e),
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Text(
                      e,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text('battery percent : ${provider.batteryPercent}'),
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
                onPressed: notifier.getBatteryLevel,
                child: const Text('Get Battery Level'))
          ],
        ),
      ],
    );
  }

  Widget _buildEtc() {
    return const Text('Etc page');
  }

  @override
  TestNotifier createProvider(WidgetRef ref) =>
      TestNotifier(TestViewModel(calculateModel: CalculateModel()));
}
