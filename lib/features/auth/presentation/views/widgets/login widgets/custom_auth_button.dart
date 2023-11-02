import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 40,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.red[700],
        textColor: Colors.white,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login With Google  "),
            Image.asset(
              "assets/images/mainlogo.png",
              width: 20,
            )
          ],
        ));
  }
}
