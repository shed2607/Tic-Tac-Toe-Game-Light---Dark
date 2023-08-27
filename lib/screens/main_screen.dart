// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/utils/buttons.dart';
import 'package:tic_tac_toe_game/utils/cell.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> elements = ['', '', '', '', '', '', '', '', ''];

  bool xTurn = true;

  int player1 = 0;
  int player2 = 0;
  int filled = 0;

  void playerChoice(int index) {
    setState(() {
      if (xTurn && elements[index] == '') {
        elements[index] = 'X';
        xTurn = !xTurn;
        filled++;
      } else if (!xTurn && elements[index] == '') {
        elements[index] = 'O';
        xTurn = !xTurn;
        filled++;
      }

      _checkWinner();
    });
  }

  void _checkWinner() {
    // Checking rows
    if (elements[0] == elements[1] &&
        elements[0] == elements[2] &&
        elements[0] != '') {
      _showDialog(elements[0]);
    }
    if (elements[3] == elements[4] &&
        elements[3] == elements[5] &&
        elements[3] != '') {
      _showDialog(elements[3]);
    }
    if (elements[6] == elements[7] &&
        elements[6] == elements[8] &&
        elements[6] != '') {
      _showDialog(elements[6]);
    }

    // Checking Column
    if (elements[0] == elements[3] &&
        elements[0] == elements[6] &&
        elements[0] != '') {
      _showDialog(elements[0]);
    }
    if (elements[1] == elements[4] &&
        elements[1] == elements[7] &&
        elements[1] != '') {
      _showDialog(elements[1]);
    }
    if (elements[2] == elements[5] &&
        elements[2] == elements[8] &&
        elements[2] != '') {
      _showDialog(elements[2]);
    }

    // Checking Diagonal
    if (elements[0] == elements[4] &&
        elements[0] == elements[8] &&
        elements[0] != '') {
      _showDialog(elements[0]);
    }
    if (elements[2] == elements[4] &&
        elements[2] == elements[6] &&
        elements[2] != '') {
      _showDialog(elements[2]);
    } else if (filled == 9) {
      _showDraw();
    }
  }

  void _showDialog(String? x) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$x is the winner'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  elements = ['', '', '', '', '', '', '', '', ''];
                  Navigator.of(context).pop();

                  filled = 0;
                });
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );
    if (x == 'X') {
      player1++;
    } else if (x == 'O') {
      player2++;
    }
  }

  void _showDraw() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No one is the winner'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  elements = ['', '', '', '', '', '', '', '', ''];
                  filled = 0;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void _showClearDraw() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No one is the winner'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  elements = ['', '', '', '', '', '', '', '', ''];
                  player1 = 0;
                  player2 = 0;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Tic Tac Toe'),
        actions: [
          Container(
            height: 40,
            padding: const EdgeInsets.only(right: 25.0),
            child: DarkOrLightBtn(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Player 1',
                      style: TextStyle(
                        fontSize: 35,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      player1.toString(),
                      style: TextStyle(
                        fontSize: 40,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Player 2',
                      style: TextStyle(
                        fontSize: 35,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      player2.toString(),
                      style: TextStyle(
                        fontSize: 40,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return PlayerCells(
                      index: index,
                      onTap: () => playerChoice(index),
                      item: elements[index],
                    );
                  },
                  itemCount: 9,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: _showClearDraw,
                  child: Text(
                    'Clear Board',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          //Spacer()
        ],
      ),
    );
  }
}
