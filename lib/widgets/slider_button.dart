import 'package:flutter/material.dart';

class SliderButton extends StatelessWidget {
  final String scrName;
  final IconData icn;
  final bool selected;
  final VoidCallback onTap;

  SliderButton({
    super.key, required this.scrName, required this.icn, required this.selected, required this.onTap,
  });

  bool loginView = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,),
        child: Container(
          height: 30,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            color: Colors.amberAccent
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icn,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  scrName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 14
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        if (scrName == 'Log In') {
          Navigator.pushNamed(context, '/login');
        } else if (scrName == 'Sign Up') {
          Navigator.pushNamed(context, '/signup');
        }
      },
    );
  }
}