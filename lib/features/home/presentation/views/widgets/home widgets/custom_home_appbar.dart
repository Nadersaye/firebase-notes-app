import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

AppBar customHomeAppbar(BuildContext context) {
  return AppBar(
    title: const Text('Firebase install'),
    centerTitle: true,
    actions: [
      IconButton(
          onPressed: () async {
            GoogleSignIn googleSignIn = GoogleSignIn();
            googleSignIn.disconnect();
            await FirebaseAuth.instance.signOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil("login", (route) => false);
          },
          icon: const Icon(Icons.exit_to_app))
    ],
  );
}
