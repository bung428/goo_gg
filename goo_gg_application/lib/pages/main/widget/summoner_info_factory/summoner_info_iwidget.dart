import 'package:flutter/material.dart';
import 'package:goo_gg_application/data/summoner/model/summoner_model.dart';
import 'package:goo_gg_model/model/riot/summoner/summoner_entry_model.dart';

abstract class SummonerInfoIWidget extends StatelessWidget {
  final SummonerModel model;
  final List<SummonerEntryModel>? entries;
  final GestureTapCallback? refreshCallback;

  const SummonerInfoIWidget({
    super.key,
    required this.model,
    this.entries,
    this.refreshCallback,
  });
}