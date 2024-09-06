import 'package:app11/dice_roller.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainter extends StatelessWidget {
 const  GradientContainter(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;
 const   GradientContainter.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.purple;

  @override
  Widget build(context) {
    return Container(
      decoration:  BoxDecoration(
        gradient  : LinearGradient(
          colors: [color1, color2
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
      ),
    child: Center(
      child: DiceRoller(),
    ),
    );
  }
}
