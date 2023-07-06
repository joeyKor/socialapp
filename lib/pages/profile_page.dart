import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  final String img;

  const ProfilePage({super.key, required this.img});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      appBar: AppBar(
        title: const Text("Profile Page"),
        backgroundColor: Colors.pink[300],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            // profile pic
            Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: CircleAvatar(
                  radius: 90.0,
                  // backgroundImage:AssetImage('${context.watch<Store1>().image}'),
                  backgroundImage: AssetImage('assets/${widget.img}.png'),
                )),
            const SizedBox(
              height: 30,
            ),
            // user email
            Text(currentUser.email!,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Yeosu Woman\'s middle school',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )

            // user detatils

            // user name

            // bio

            // user posts
          ],
        ),
      ),
    );
  }
}
