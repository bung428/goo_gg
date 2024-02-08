import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:goo_gg_application/data/summoner/extension/summoner_entry.dart';
import 'package:goo_gg_application/pages/main/widget/summoner_info_factory/summoner_info_iwidget.dart';
import 'package:goo_gg_application/pages/main/widget/summoner_profile_img_widget.dart';
import 'package:goo_gg_application/widget/asset_imge_widget.dart';
import 'package:goo_gg_model/model/summoner/summoner_entry_model.dart';

class SummonerInfoMobileWidget extends SummonerInfoIWidget {
  final VoidCallback refreshMatchesCallback;
  final VoidCallback inGameCallback;
  final String image;

  const SummonerInfoMobileWidget({
    super.key,
    super.entries,
    required super.model,
    required this.image,
    required this.inGameCallback,
    required this.refreshMatchesCallback,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
     children: [
       Stack(
         children: [
           ClipRRect(
             borderRadius: BorderRadius.circular(24),
             child: AssetImageWidget(
               width: double.infinity,
               image: image,
               isPng: false,
             ),
           ),
           Positioned(
             left: 0,
             right: 0,
             bottom: 0,
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Row(
                   children: [
                     SummonerProfileImgWidget(
                       url: model.profileImg,
                       level: model.summonerLevelStr,
                       position: LevelPosition.center,
                       imgSize: 88,
                       lvSize: 24,
                       borderRadius: 36,
                     ),
                     const SizedBox(width: 8,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(model.name, style: theme.textTheme.titleLarge?.copyWith(
                             color: theme.scaffoldBackgroundColor,
                             fontWeight: FontWeight.bold
                         ),),
                         Text(model.tagLine, style: theme.textTheme.bodySmall?.copyWith(
                           color: theme.dividerColor,
                         ),),
                       ],
                     )
                   ],
                 ),
                 const SizedBox(height: 16,),
                 Row(
                   children: [
                     const SizedBox(width: 16,),
                     Expanded(
                         child: ElevatedButton(
                             onPressed: refreshMatchesCallback,
                             child: Text('전적갱신')
                         )
                     ),
                     const SizedBox(width: 16,),
                     Expanded(
                         child: ElevatedButton(
                             onPressed: inGameCallback,
                             child: Text('인게임')
                         )
                     ),
                     const SizedBox(width: 16,),
                   ],
                 ),
                 const SizedBox(height: 16,),
               ],
             ),
           ),
         ],
       ),
       const SizedBox(height: 16,),
       if (entries?.isNotEmpty == true)
         Row(
           children: [
             Expanded(
               flex: 1,
               child: Container(
                 padding: const EdgeInsetsApp(all: 8),
                 decoration: BoxDecoration(
                   color: theme.dividerColor,
                   borderRadius: BorderRadius.circular(24),
                 ),
                 child: Row(
                   children: [
                     AssetImageWidget(
                       width: 52,
                       height: 66,
                       image: entries!.first.tierImg,
                       fit: BoxFit.contain,
                     ),
                     const SizedBox(width: 12,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(entries!.first.type.title, style: theme.textTheme.bodyMedium?.copyWith(
                           color: theme.primaryColorDark,
                         ),),
                         Text('${entries!.first.tier} ${entries!.first.rank}', style: theme.textTheme.bodyLarge?.copyWith(
                             fontWeight: FontWeight.bold
                         ),),
                         Text('${entries!.first.leaguePoints.toString()} LP', style: theme.textTheme.bodySmall?.copyWith(
                             color: theme.disabledColor
                         ),),
                         Text('${entries!.first.wins}승 ${entries!.first.losses}패 (${entries!.first.winPercent}%)', style: theme.textTheme.bodySmall?.copyWith(
                             color: theme.disabledColor
                         ),),
                       ],
                     )
                   ],
                 ),
               ),
             ),
             const SizedBox(width: 12,),
             Expanded(
               flex: 1,
               child: Container(
                 padding: const EdgeInsetsApp(all: 8),
                 decoration: BoxDecoration(
                   color: theme.dividerColor,
                   borderRadius: BorderRadius.circular(24),
                 ),
                 child: Row(
                   children: [
                     AssetImageWidget(
                       width: 52,
                       height: 66,
                       image: entries!.last.tierImg,
                       fit: BoxFit.contain,
                     ),
                     const SizedBox(width: 12,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(entries!.last.type.title, style: theme.textTheme.bodyMedium?.copyWith(
                           color: theme.primaryColorDark,

                         ),),
                         Text('${entries!.last.tier} ${entries!.last.rank}', style: theme.textTheme.bodyLarge?.copyWith(
                             fontWeight: FontWeight.bold
                         ),),
                         Text('${entries!.last.leaguePoints.toString()} LP', style: theme.textTheme.bodySmall?.copyWith(
                             color: theme.disabledColor
                         ),),
                         Text('${entries!.last.wins}승 ${entries!.last.losses}패 (${entries!.last.winPercent}%)', style: theme.textTheme.bodySmall?.copyWith(
                             color: theme.disabledColor
                         ),),
                       ],
                     )
                   ],
                 ),
               ),
             ),
           ]
         )
     ],
   );
  }
}