import 'package:first_app/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ExtSourceLoginSignup extends StatelessWidget {
  const ExtSourceLoginSignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Or Connect Using",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExtSourceLoginButton(icon: "assets/icons/facebook.svg",),
            ExtSourceLoginButton(icon: "assets/icons/google.svg",)
          ],
        )
      ],
    );
  }
}


