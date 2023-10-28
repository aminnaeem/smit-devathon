import 'package:first_app/constraints/colors.dart';
import 'package:flutter/material.dart';

class DataBars extends StatelessWidget {
  final String hintText;
  final String title;
  final IconData fieldSuffix;
  const DataBars({super.key, required this.hintText, required this.title, required this.fieldSuffix});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Container(
          height: 56,
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: AppColors.searchBarColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              hintText: hintText, hintStyle: TextStyle(
                fontSize: 14
              ),
              suffixIcon: Icon(
                fieldSuffix,
                color: Colors.black38,),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 20))
      ],
    );
  }
}