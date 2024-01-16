import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                padding: EdgeInsets.all(20),
                color: Colors.pink,
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ElevatedButton(
                          
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)
                              )
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade300),
                          ),
                          onPressed: () {}, 
                          child: Text(
                            "X", 
                            style: GoogleFonts.lat
                            // (
                            //   textStyle: Theme.of(context).textTheme.headline4
                            // ),
                          )
                        ),
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
