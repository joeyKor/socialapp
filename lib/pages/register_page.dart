import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/text_filed.dart';

class Registerpage extends StatefulWidget {
  final Function()? onTap;
  const Registerpage({super.key, required this.onTap});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final emailTextController = TextEditingController();
  final passwrodTextController = TextEditingController();
  final confirmpwTextController = TextEditingController();

  void signUp() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    if (passwrodTextController.text != confirmpwTextController.text) {
      Navigator.pop(context);
      displayMessage("Password don't match");
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text,
          password: passwrodTextController.text);

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(message),
          )),
    );
  }

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
                Icons.lock,
                size: 100,
                color: Colors.pink[400],
              ),

              const SizedBox(
                height: 50,
              ),

              //welcome bakc message
              const Text("Let's create an account for you"),
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
                  hintText: 'Password',
                  obscureText: true),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: confirmpwTextController,
                  hintText: 'Confirm Password',
                  obscureText: true),
              const SizedBox(
                height: 10,
              ),
              MyButton(onTap: signUp, text: 'Sign up'),

              // sign button

              //go to register
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now',
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
}
