import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo4/constance.dart';

class Todo_karte extends StatelessWidget {
  Todo_karte(
      {required this.colour, required this.cardChild, required this.onPress});

  final Color colour;
  final Widget cardChild;
  final onPress;

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
          child: cardChild,
          margin: EdgeInsets.all(cardChildMargin),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ));
  }
}
