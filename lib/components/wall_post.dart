import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/components/comment_button.dart';
import 'package:socialapp/components/like_button.dart';
import 'package:socialapp/helper/helper_methods.dart';
import 'comment.dart';

class WallPost extends StatefulWidget {
  final String weather;
  final String date;
  final String feeling;
  final String img;

  final String message;
  final String user;
  final String postId;
  final List<String> likes;
  final int commnetcnt;

  const WallPost(
      {super.key,
      required this.message,
      required this.user,
      required this.likes,
      required this.postId,
      required this.commnetcnt,
      required this.date,
      required this.feeling,
      required this.weather,
      required this.img});

  @override
  State<WallPost> createState() => _WallPostState();
}

class _WallPostState extends State<WallPost> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;
  var cnt = 0;

  final _commentTextsControler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  void addComment(String commentText) {
    FirebaseFirestore.instance
        .collection('User Posts')
        .doc(widget.postId)
        .collection("Comments")
        .add({
      'CommentText': commentText,
      "CommentedBy": currentUser.email,
      "CommentTime": Timestamp.now()
    });
  }

  // void showCommentDialog() {

  //   showDialog(context: context, builder: (context)=> AlertDialog(title: const Text("add commnet"), content: TextField(controller:_commentTextsControler, decoration: const InputDecoration(hintText: 'Write a comment...'),),actions: [
  //     TextButton(onPressed:() => addComment(_commentTextsControler.text), child: const Text('Post'))
  //   ],));
  // }

  void showCommentDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('댓글쓰기'),
              content: TextField(
                controller: _commentTextsControler,
                decoration: const InputDecoration(hintText: '댓글을 입력하세요....'),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      addComment(_commentTextsControler.text);
                      _commentTextsControler.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Post')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'))
              ],
            ));
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    // Access the documnet is Firebase
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);
    if (isLiked) {
      // if the post is now liekd, add user's email to the 'likes' field
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      // if the post is now unliked, remove the user's email from the 'likes field
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage('assets/${widget.img}.png'),
                        // backgroundImage: AssetImage('assets/${widget.img}.png'),
                      )),
                  Column(
                    children: [
                      Text(
                        widget.user,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                        Text(
                          widget.date,
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 11),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          widget.weather,
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 11),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          widget.feeling,
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 11),
                        ),
                        // Expanded(
                        //   flex: 3,
                        //   child: Text(
                        //     widget.date,
                        //     style: TextStyle(color: Colors.grey[500]),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Text(
                        //     widget.weather,
                        //     style: TextStyle(color: Colors.grey[500]),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Text(
                        //     widget.feeling,
                        //     style: TextStyle(color: Colors.grey[400]),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: 7,
                        // ),
                      ]),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.message,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  // Icon(Icons.face),
                  LikeButton(isLiked: isLiked, onTap: toggleLike),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.likes.length.toString(),
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  // Icon(Icons.face),
                  CommentButton(onTap: showCommentDialog),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '.',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          // const SizedBox(
          //   width: 5,
          // ),
// comments under the post
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("User Posts")
                .doc(widget.postId)
                .collection('Comments')
                .orderBy("CommentTime", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: snapshot.data!.docs.map((doc) {
                  final commentData = doc.data() as Map<String, dynamic>;

                  return Comment(
                    text: commentData["CommentText"],
                    user: commentData['CommentedBy'],
                    time: formatData(commentData['CommentTime']),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
