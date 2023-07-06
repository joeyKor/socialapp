import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialapp/components/wall_post.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        // the wall
        Expanded(
            child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('User Posts')
              .orderBy("TimeStamp", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final post = snapshot.data!.docs[index];
                    return WallPost(
                      date: post['Date'],
                      weather: post['Weather'],
                      feeling: post['Feeling'],
                      message: post['Message'],
                      user: post['UserEmail'],
                      postId: post.id,
                      likes: List<String>.from(post['Likes'] ?? []),
                      commnetcnt: 1,
                      img: post['UserEmail'].toString().split('@')[0],
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error : ${snapshot.error}'),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )),
      ]),
    );
  }
}
