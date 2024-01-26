import 'package:flutter/material.dart';

enum GameResult {
  win('승리', Colors.blue),
  lose('패배', Colors.red),
  ;

  final String value;
  final Color color;
  const GameResult(this.value, this.color);
}