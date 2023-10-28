import 'package:flutter/material.dart';

class ScrNameAndDetails extends StatelessWidget {
  final String srcName;

  const ScrNameAndDetails({
    super.key,
    required this.srcName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(text: TextSpan(
          text: srcName,
          style: const TextStyle(
            fontFamily: "NunitoSans",
            color: Colors.amber,
            fontSize: 24,
            fontWeight: FontWeight.w600
          )
        )),
      ],
    );
  }
}