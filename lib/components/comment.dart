import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String text;
  final String user;
  final String time;

  const Comment(
      {super.key, required this.text, required this.user, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.pink[100], borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(text),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              user,
              style: TextStyle(color: Colors.grey[700]),
            ),
            Text(
              ' : ',
              style: TextStyle(color: Colors.grey[700]),
            ),
            Text(time, style: TextStyle(color: Colors.grey[700])),
          ],
        )
      ]),
    );
  }
}
