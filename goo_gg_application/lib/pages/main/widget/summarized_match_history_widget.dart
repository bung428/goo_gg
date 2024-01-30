import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:goo_gg_application/data/model/match/match_history_model.dart';
import 'package:goo_gg_application/main.dart';
import 'package:goo_gg_application/widget/app_cached_network_image.dart';

class SummarizedMatchHistoryWidget extends StatelessWidget {
  final SummarizedMatchModel model;

  const SummarizedMatchHistoryWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gameResult = model.gameInfo.gameResult;
    return Padding(
      padding: const EdgeInsetsApp(horizontal: 4, vertical: 8),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.gameInfo.gameType.type,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: gameResult.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                model.gameInfo.finishedAtStr,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.disabledColor
                ),
              ),
              const SizedBox(height: 12,),
              Text(
                model.gameInfo.gameResult.value,
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.disabledColor
                ),
              ),
              Text(
                model.gameInfo.gameDuration,
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.disabledColor
                ),
              ),
            ],
          ),
          const SizedBox(width: 12,),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start, // 추가
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      ClipOval(
                        child: AppCachedNetworkImage(
                          size: 48,
                          url: model.summonerRecord.championUrl,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.textColor,
                          ),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                model.summonerRecord.championLevel.toString(),
                                style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.scaffoldBackgroundColor
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 4,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppCachedNetworkImage(
                        url: model.summonerRecord.spells.first,
                        size: 16,
                      ),
                      const SizedBox(height: 4,),
                      AppCachedNetworkImage(
                        url: model.summonerRecord.spells.last,
                        size: 16,
                      ),
                    ],
                  ),
                  const SizedBox(width: 4,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppCachedNetworkImage(
                        url: model.summonerRecord.runes.first,
                        size: 16,
                      ),
                      const SizedBox(height: 4,),
                      AppCachedNetworkImage(
                        url: model.summonerRecord.runes.last,
                        size: 16,
                      ),
                    ],
                  ),
                  const SizedBox(width: 4,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.scaffoldBackgroundColor
                          ),
                          children: [
                            TextSpan(
                              text: model.summonerRecord.kill.toString(),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.scaffoldBackgroundColor,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            TextSpan(
                              text: ' / ',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.disabledColor,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            TextSpan(
                              text: model.summonerRecord.death.toString(),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.red.withOpacity(0.7),
                              )
                            ),
                            TextSpan(
                                text: ' / ',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.disabledColor,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            TextSpan(
                              text: model.summonerRecord.assist.toString(),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.scaffoldBackgroundColor,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ]
                        )
                      ),
                      Text(
                        '${model.summonerRecord.grade.toStringAsFixed(2)} : 1',
                        style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.disabledColor,
                            fontWeight: FontWeight.bold
                        )
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: model.summonerRecord.items.map((e) {
                  final isLast = e == model.summonerRecord.items.last;
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
        ],
      ),
    );
  }
}
