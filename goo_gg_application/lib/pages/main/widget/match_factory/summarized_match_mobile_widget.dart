import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:goo_gg_application/pages/main/widget/match_factory/summarized_match_iwidget.dart';
import 'package:goo_gg_application/pages/main/widget/summoner_profile_img_widget.dart';
import 'package:goo_gg_application/widget/app_cached_network_image.dart';
import 'package:goo_gg_application/widget/touch_well.dart';

class SummarizedMatchMobileWidget extends SummarizedMatchIWidget {
  final GestureTapCallback onTap;

  const SummarizedMatchMobileWidget({
    super.key,
    required this.onTap,
    required super.color,
    required super.summarized,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final record = summarized.summonerRecord;
    return Padding(
      padding: const EdgeInsetsApp(vertical: 8),
      child: TouchWell(
        onTap: onTap,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: color,
                  width: 52,
                  padding: const EdgeInsetsApp(horizontal: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        summarized.gameInfo.gameResult.value,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.scaffoldBackgroundColor
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Divider(height: 1, color: theme.scaffoldBackgroundColor,),
                      const SizedBox(height: 8,),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          summarized.gameInfo.gameDuration,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.scaffoldBackgroundColor
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12,),
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start, // 추가
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SummonerProfileImgWidget(
                          borderRadius: 20,
                          imgSize: 48,
                          lvSize: 16,
                          position: LevelPosition.start,
                          url: record.championUrl,
                          level: record.championLevel.toString(),
                        ),
                        const SizedBox(width: 4,),
                        _buildChampInitInfo(record.spells),
                        const SizedBox(width: 4,),
                        _buildChampInitInfo(record.runes),
                        const SizedBox(width: 4,),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: theme.scaffoldBackgroundColor
                                ),
                                children: [
                                  TextSpan(
                                    text: record.kill.toString(),
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  TextSpan(
                                    text: ' / ',
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      color: theme.disabledColor,
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  TextSpan(
                                    text: record.death.toString(),
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.withOpacity(0.7),
                                    )
                                  ),
                                  TextSpan(
                                    text: ' / ',
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      color: theme.disabledColor,
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  TextSpan(
                                    text: record.assist.toString(),
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                ]
                              )
                            ),
                            const SizedBox(height: 4,),
                            Text(
                              '${record.grade.toStringAsFixed(2)} : 1',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.disabledColor,
                                fontWeight: FontWeight.bold
                              )
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: record.items.map((e) {
                        final isLast = e == record.items.last;
                        final child = ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: AppCachedNetworkImage(url: e, size: 24,)
                        );
                        return isLast ? child : Row(
                          children: [
                            child,
                            const SizedBox(width: 2,)
                          ],
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(summarized.gameInfo.gameType.type),
                    Text(summarized.gameInfo.finishedAtStr,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChampInitInfo(List<String> list) {
    return Column(
      children: [
        AppCachedNetworkImage(
          url: list.first,
          decoType: DecoType.borderRadius,
          size: 20,
        ),
        const SizedBox(height: 4,),
        AppCachedNetworkImage(
          url: list.last,
          decoType: DecoType.borderRadius,
          size: 20,
        ),
      ],
    );
  }
}