import 'package:flutter/material.dart';
import 'package:socialapp/components/text_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  final dateController = TextEditingController();

  final contentController = TextEditingController();

  final weatherController = TextEditingController();

  final feelingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            MyTextField(
                controller: dateController,
                hintText: 'Date',
                obscureText: false),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                      controller: weatherController,
                      hintText: 'Weather',
                      obscureText: false),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: MyTextField(
                      controller: feelingController,
                      hintText: 'Feeling',
                      obscureText: false),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: contentController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    obscureText: false,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'story',
                        hintStyle: TextStyle(color: Colors.grey[500])),
                  ),
                ),
                IconButton(
                    onPressed: postMessage,
                    iconSize: 30,
                    icon: const Icon(Icons.upload_rounded)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void postMessage() {
    if (contentController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('User Posts').add({
        'UserEmail': currentUser.email,
        'Date': dateController.text,
        'Weather': weatherController.text,
        'Feeling': feelingController.text,
        'Message': contentController.text,
        'TimeStamp': Timestamp.now(),
        'Likes': [],
      });

      AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              showCloseIcon: true,
              title: 'success',
              desc: '일기를 성공적으로 게시하였습니다.',
              btnOkOnPress: () {})
          .show();
    }
    setState(() {
      contentController.clear();
      dateController.clear();
      weatherController.clear();
      feelingController.clear();
    });
  }
}
