import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/components/button.dart';
import 'package:socialapp/components/text_filed.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwrodTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              //logo
              Icon(
                Icons.book,
                size: 100,
                color: Colors.pink[400],
              ),

              const SizedBox(
                height: 50,
              ),

              //welcome bakc message
              const Text("JeonNamStargram"),
              const SizedBox(
                height: 25,
              ),
              //e-mail
              MyTextField(
                  controller: emailTextController,
                  hintText: 'e-mail',
                  obscureText: false),

              //password
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: passwrodTextController,
                  hintText: 'password',
                  obscureText: true),
              const SizedBox(
                height: 10,
              ),

              MyButton(
                  onTap: signIn,
                  // onTap: () async {
                  //   print('hi 222');
                  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
                  //       email: 'abc@naver.com', password: '11111111');
                  // },
                  text: 'Sign in'),

              // sign button

              //go to register
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a member?"),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextController.text,
          password: passwrodTextController.text);

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // TODO
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  void displayMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
            ));
  }
}
