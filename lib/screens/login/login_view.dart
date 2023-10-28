import 'package:first_app/constraints/colors.dart';
import 'package:first_app/constraints/images.dart';
import 'package:first_app/screens/signup/signup_view.dart';
import 'package:first_app/widgets/fields.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Images.loginSigupImage,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: RichText(text: TextSpan(
                text: "Login",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black
                )
              )),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                child: Form( 
                  child: Column(
                    children: [
                      DataBars(hintText: 'Enter your Username', title: 'Username:', fieldSuffix: Icons.person,),
                      DataBars(hintText: 'Enter your Password', title: 'Password:', fieldSuffix: Icons.password_rounded,)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.mainColor),
                  shadowColor: MaterialStateProperty.all(AppColors.buttonShadowColor)
                ),
              ),
            ),
            Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width*.35,
                    color: AppColors.lineColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        color: AppColors.lineColor,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width*.35,
                    color: AppColors.lineColor,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New User? ",
                  style: TextStyle(
                    color: AppColors.lineColor,
                    fontWeight: FontWeight.w600
                  ),
                ),
                GestureDetector(
                  child: Text(
                    "Register here",
                    style: TextStyle(
                      color: AppColors.buttonShadowColor,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignupView(),)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}