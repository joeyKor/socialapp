import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({required this.onTap, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.pink[700], borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
