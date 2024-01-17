import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {

  final String gameTileValue;
  final Function(String?)? onGameTileTapped;
  const GameTile({
    super.key,
    required this.gameTileValue,
    required this.onGameTileTapped
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}