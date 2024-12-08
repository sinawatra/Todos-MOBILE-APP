import 'package:flutter/material.dart';
import '../util/my_button.dart';

class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller ,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "Add new task"),
            ),

            //button -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              //save
              MyButton(text: "Save", onPressed: onSave),

              const SizedBox(width: 10),

              //cancel
              MyButton(text: "Cancel", onPressed: onCancel),
            ],)
          ],
        ),
      ),
    );
  }
}
