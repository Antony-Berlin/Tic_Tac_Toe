import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/game_tile.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List gameTileValueList = ["X", "O", " ", "X", "O", "O", "X", "X", "X"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //player score
          Expanded(
              child: Container(
            color: Colors.pink,
          )),
          //game
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.pink,
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return  GameTile(gameTileValue: gameTileValueList[index]);
                    }),
              )),
          //play again new game buttons
          // Expanded(
          //     child: Container(
          //   color: Colors.pink,
          // )),
        ],
      ),
    );
  }
}
