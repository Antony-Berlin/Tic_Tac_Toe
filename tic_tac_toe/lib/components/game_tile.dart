import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {

  final String gameTileValue;
  const GameTile({
    super.key,
    required this.gameTileValue
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(3.0),
      child: ElevatedButton(
        
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            )
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade500),
        ),
        onPressed: () {}, 
        child:  Text(
          gameTileValue, 
          style: TextStyle(fontFamily: "ArchitectsDaughter-Regular", fontSize: 40.0, fontWeight: FontWeight.bold)
        )
      ),
    );
  }
}