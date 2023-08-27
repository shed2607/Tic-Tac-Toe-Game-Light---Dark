import 'package:flutter/material.dart';

class ShowWinnerDialog extends StatelessWidget {
  final String winner;

  const ShowWinnerDialog({required this.winner, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$winner is the winner'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

// Usage:

// When you want to show the winner dialog:
void _showWinnerDialog(BuildContext context, String winner) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ShowWinnerDialog(winner: winner);
    },
  );
}
