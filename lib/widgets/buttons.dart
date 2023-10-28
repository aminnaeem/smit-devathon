import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginSignupButton extends StatelessWidget {
  final dynamic buttonText;
  final void Function()? onPressed;

  const LoginSignupButton({
    super.key,
    required GlobalKey<FormState> formKey, required this.buttonText, required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: buttonText,
        )
      ),
    );
  }
}

class ExtSourceLoginButton extends StatelessWidget {
  final String icon;

  const ExtSourceLoginButton({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(CircleBorder())
      ),
      onPressed: (){},
      child: CircleAvatar(
        child: SvgPicture.asset(icon), 
      )
    );
  }
}
