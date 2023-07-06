import 'package:flutter/material.dart';
import 'package:socialapp/components/my_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialapp/pages/profile_page.dart';

class MyDrawer extends StatelessWidget {
  final String img;

  const MyDrawer({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.pink[300],
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// home list tile
        Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: CircleAvatar(
                  radius: 50.0,
                  // backgroundImage:AssetImage('${context.watch<Store1>().image}'),
                  backgroundImage: AssetImage('assets/$img.png'),
                )),
            MyListTile(
              icon: Icons.home,
              text: 'H O M E',
              onTap: () => Navigator.pop(context),
            ),
// profile list tile
            MyListTile(
              icon: Icons.person,
              text: 'P R O F I L E',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(
                            img: img.toString(),
                          ))),
            ),
          ],
        ),
// logout list tile
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: MyListTile(
              icon: Icons.logout,
              text: 'L O G O U T',
              onTap: () => FirebaseAuth.instance.signOut()),
        )
      ]),
    );
  }
}
