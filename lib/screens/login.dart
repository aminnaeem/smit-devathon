import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/thanks_page.dart';
import 'package:first_app/widgets/buttons.dart';
import 'package:first_app/widgets/ext_login_signup.dart';
import 'package:first_app/widgets/scr_details.dart';
import 'package:first_app/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key,});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool isLogin = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*0.9,
              // height: MediaQuery.of(context).size.height*0.95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  // mainAxisAlignment: MainAxisA lignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const ScrNameAndDetails(srcName: 'Log In',),
                        Image.asset(
                          'assets/images/login.png',
                          height: 200,
                        ),
                      ],
                    ),
                    // const Spacer(),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          EmailField(emailController: emailController),
                          const SizedBox(
                            height: 20,
                          ),
                          PasswordField(passwordController: passwordController),
                          LoginSignupButton(
                            formKey: _formKey,
                            buttonText:
                            isLogin == true ?
                            CircularProgressIndicator(
                              color: Colors.white,
                            ) :
                            Text('Log In',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.white
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                isLogin = true;
                              });
                              try {
                                final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text
                                );
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ThanksPage()));
                              } on FirebaseAuthException catch (e) {
                                setState(() {
                                  isLogin = false;
                                });
                                if (e.code == 'user-not-found') {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text('No user found for that email'),
                                  ));
                                  print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text('Wrong password provided for that user'),
                                  ));
                                  print('Wrong password provided for that user.');
                                }
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    const ExtSourceLoginSignup(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



