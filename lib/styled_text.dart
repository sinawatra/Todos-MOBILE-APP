import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children:  [
        Text(
          "ABA Mobile",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        Text(
          "ABA Mobile | National Bank Of Canada Group",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
