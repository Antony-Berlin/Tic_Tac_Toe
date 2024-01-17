import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/game_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List gameTileValueList = [" ", " ", " ", " ", " ", " ", " ", " ", " "];

  int player = 1;
  int player1S = 0;
  int player2S = 0;
  void onGameTileTapped(index) {
    print(gameTileValueList);

    if (gameTileValueList[index] == " ") {
      if (player == 1) {
        player = 2;
        setState(() {
          gameTileValueList[index] = 'X';
        });
      } else {
        setState(() {
          player = 1;
          gameTileValueList[index] = 'O';
        });
      }
    }

    //check if anybody won the game
    checkWinner();
  }

  void checkWinner() {
    int winner = 0;
    List gTL = gameTileValueList;
    if (((gTL[4] == gTL[0] && gTL[4] == gTL[8]) ||
            (gTL[4] == gTL[1] && gTL[4] == gTL[7]) ||
            (gTL[4] == gTL[2] && gTL[4] == gTL[6]) ||
            (gTL[4] == gTL[3] && gTL[4] == gTL[5])) &&
        gTL[4] != " ") {
      winner = gTL[4] == "X" ? 1 : 2;
      print("cond1");
    } else if (((gTL[0] == gTL[1] && gTL[0] == gTL[2]) ||
            (gTL[0] == gTL[3] && gTL[0] == gTL[6])) &&
        gTL[0] != " ") {
      winner = gTL[0] == "X" ? 1 : 2;
      print("cond2");
    } else if (((gTL[8] == gTL[5] && gTL[8] == gTL[2]) ||
            (gTL[8] == gTL[7] && gTL[8] == gTL[6])) &&
        gTL[8] != " ") {
      winner = gTL[0] == "X" ? 1 : 2;
      print("cond3");
    }
    if (winner != 0) {
      if (winner == 1) {
        player1S++;
      } else {
        player2S++;
      }
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Player $winner won the game"),
            );
          });
      resetGame();
    }
  }

  void resetGame() {
    for (int i = 0; i < gameTileValueList.length; i++) {
      gameTileValueList[i] = " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text("Tic Tac Toe",
            textAlign: TextAlign.center,
            style: TextStyle(
              
              fontFamily: "ArchitectsDaughter-Regular",
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 45, 188, 244),
            ),
          ),
        ),
        backgroundColor: const Color(0xFFE91E63),
      ),
      body: Column(
        children: [
          //player score
          Expanded(
              child: Container(
            color: Color(0xFFE91E63),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.pink[300],
                    ),
                    width: 150,
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "player 1",
                          style: TextStyle(
                            fontFamily: "ArchitectsDaughter-Regular",
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 244, 201, 45),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Score: $player1S",
                          style: const TextStyle(
                            fontFamily: "ArchitectsDaughter-Regular",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.pink[300],
                    ),
                    width: 150,
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "player 2",
                          style: TextStyle(
                            fontFamily: "ArchitectsDaughter-Regular",
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 244, 201, 45),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Score: $player2S",
                          style: const TextStyle(
                            fontFamily: "ArchitectsDaughter-Regular",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
          //game
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.pink,
                child: GridView.builder(
                    itemCount: 9,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.pink.shade300),
                            ),
                            onPressed: () {
                              onGameTileTapped(index);
                            },
                            child: Text(gameTileValueList[index],
                                style: TextStyle(
                                    fontFamily: "ArchitectsDaughter-Regular",
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold))),
                      );
                    }),
              )),
          //play again new game buttons
          Expanded(
              child: Container(
            color: Colors.pink,
          )),
        ],
      ),
    );
  }
}
