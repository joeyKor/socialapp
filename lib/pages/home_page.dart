// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:socialapp/components/drawer.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:socialapp/components/wall_post.dart';
// import 'package:socialapp/pages/profile_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final currentUser = FirebaseAuth.instance.currentUser!;
//   final textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         title: Text(currentUser.email!),
//         backgroundColor: Colors.grey[900],
//         actions: [
//           IconButton(
//             onPressed: signOut,
//             icon: const Icon(Icons.logout),
//           )
//         ],
//       ),
//       drawer: const MyDrawer(
      
//       ),
//       body: Center(
//         child: Column(children: [
//           // the wall
//           Expanded(
//               child: StreamBuilder(
//             stream: FirebaseFirestore.instance
//                 .collection('User Posts')
//                 .orderBy("TimeStamp", descending: true)
//                 .snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (context, index) {
//                       final post = snapshot.data!.docs[index];
//                       return WallPost(
//                           date: post['Date'],
//                           weather: post['Weather'],
//                           feeling: post['Feeling'],
//                           message: post['Message'],
//                           user: post['UserEmail'],
//                           postId: post.id,
//                           likes: List<String>.from(post['Likes'] ?? []),
//                           commnetcnt: 1);
//                     });
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text('Error : ${snapshot.error}'),
//                 );
//               }

//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             },
//           )),

//         ]),
//       ),
//     );
//   }

//   void signOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   void postMessage() {
//     if (textController.text.isNotEmpty) {
//       FirebaseFirestore.instance.collection('User Posts').add({
//         'UserEmail': currentUser.email,
//         'Message': textController.text,
//         'TimeStamp': Timestamp.now(),
//         'Likes': [],
//       });
//     }
//     setState(() {
//       textController.clear();
//     });
//   }

//   void goToProfilePage() {
//     Navigator.pop(context);
//     MaterialPageRoute(
//       builder: (context) => const ProfilePage(),
//     );
//   }
// }
