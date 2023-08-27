// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PlayerCells extends StatelessWidget {
  final int index;
  final Function()? onTap;
  final String item;
  const PlayerCells(
      {super.key, required this.index, this.onTap, required this.item});

  @override
  Widget build(BuildContext context) {
    bool isX = item == 'X';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: _getBorderForCell(index, context),
        ),
        child: Center(
          child: Text(
            item,
            style: TextStyle(
              fontSize: 50,
              color: isX ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Border _getBorderForCell(int index, BuildContext context) {
    BorderSide top = BorderSide.none;
    BorderSide left = BorderSide.none;
    BorderSide right = BorderSide.none;
    BorderSide bottom = BorderSide.none;

    if (index < 3) {
      bottom = BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 5,
      );
    }
    if (index % 3 == 0) {
      right = BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 5,
      );
    }
    if ((index + 1) % 3 == 0) {
      left = BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 5,
      );
    }
    if (index > 5) {
      top = BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 5,
      );
    }

    return Border(top: top, left: left, right: right, bottom: bottom);
  }
}
