import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:goo_gg_application/data/summoner/extension/summoner_entry.dart';
import 'package:goo_gg_application/data/summoner/model/summoner_model.dart';
import 'package:goo_gg_application/util/datetime_util.dart';
import 'package:goo_gg_application/widget/asset_imge_widget.dart';
import 'package:goo_gg_application/widget/touch_well.dart';
import 'package:goo_gg_model/model/summoner/summoner_entry_model.dart';

class SummonerInfoWidget extends StatelessWidget {
  final SummonerModel model;
  final List<SummonerEntryModel>? entries;

  const SummonerInfoWidget({super.key, required this.model, this.entries});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateInfo = DateTimeUtil().calculateDaysDifference(DateTime(2024, 1, 22));
    final state = dateInfo.$1;
    final dateDesc = dateInfo.$2;
    final updateAt = dateDesc == 'same' ? model.updateAt : dateDesc;
    print('KBG model : ${model.toJson()}');
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsetsApp(horizontal: 12, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    width: 88,
                    height: 88,
                    imageUrl: model.profileImg,
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: theme.primaryColor.withOpacity(0.1)),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsetsApp(all: 4),
                      child: Text(
                        'Lv ${model.levelStr}',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.primaryColor),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(model.name, style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold
                        ),),
                        const SizedBox(width: 4,),
                        Text(model.tag, style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: theme.disabledColor
                        ),),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (state == RefreshState.possible) ...[
                          TouchWell(
                              onTap: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)
                              ),
                              bgColor: theme.primaryColor.withOpacity(0.7),
                              child: Padding(
                                padding: const EdgeInsetsApp(all: 4),
                                child: Text('갱신 가능', style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.scaffoldBackgroundColor
                                ),),
                              )
                          ),
                          const SizedBox(width: 8,)
                        ],
                        Text(
                          '마지막 갱신 : $updateAt',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            if (entries?.isNotEmpty == true) ...[
              const SizedBox(height: 24,),
              Divider(height: 1, color: theme.scaffoldBackgroundColor,),
              const SizedBox(height: 24,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: entries!.map((e) => Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      AssetImageWidget(
                        width: 52,
                        height: 66,
                        image: e.tierImg,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.type.title, style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.primaryColorDark,

                          ),),
                          Text('${e.tier} ${e.rank}', style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold
                          ),),
                          Text('${e.leaguePoints.toString()} LP', style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.disabledColor
                          ),),
                          Text('${e.wins}승 ${e.losses}패 (${e.winPercent}%)', style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.disabledColor
                          ),),
                        ],
                      )
                    ],
                  ),
                )).toList(),
              )
            ]
          ],
        ),
      ),
    );
  }
}
