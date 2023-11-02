import 'package:flutter/material.dart';

class CustomAnotherOptionText extends StatelessWidget {
  const CustomAnotherOptionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed("signup");
      },
      child: const Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(
            text: "Don't Have An Account ? ",
          ),
          TextSpan(
              text: "Register",
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
        ])),
      ),
    );
  }
}
