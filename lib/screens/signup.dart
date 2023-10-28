import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/thanks_page.dart';
import 'package:first_app/widgets/buttons.dart';
import 'package:first_app/widgets/ext_login_signup.dart';
import 'package:first_app/widgets/scr_details.dart';
import 'package:first_app/widgets/text_fields.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


class SignupPage extends StatefulWidget {

  const SignupPage({super.key,});

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isSignup = false;
  final _formKey = GlobalKey<FormState>();
  int navigateToPage = 0;
  

  File ? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const ScrNameAndDetails(srcName: 'Sign Up',),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black12,
                          radius: 50,
                          child: _selectedImage != null ? Image.file(_selectedImage!,
                            fit: BoxFit.scaleDown,
                          ) : const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.black38,
                          ),
                        ),
                        GestureDetector(
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.lightBlue,
                            child: Icon(
                              Icons.camera_alt_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  title: Text("Select an Option"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.camera_alt_rounded),
                                        title: Text("Take Photo"),
                                        onTap: () async {
                                          Navigator.of(context).pop();
                                          _pickImageFromCamera();
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.photo_library_rounded),
                                        title: Text("Upload Photo"),
                                        onTap: () async {
                                          Navigator.of(context).pop();
                                          _pickImageFromGallery();
                                        },
                                      ),
                                      if(_selectedImage != null)
                                        ListTile(
                                          leading: Icon(Icons.remove_circle_rounded),
                                          title: Text("Remove Photo"),
                                          onTap: () async {
                                            Navigator.of(context).pop();
                                            _selectedImage?.delete();
                                            setState(() {
                                              _selectedImage == null;
                                            });
                                          },
                                        ),
                                    ],
                                  ),
                                );
                              })
                            );
                          },
                        )
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          NameField(nameController: nameController),
                          const SizedBox(
                            height: 10,
                          ),
                          EmailField(emailController: emailController),
                          const SizedBox(
                            height: 10,
                          ),
                          PhoneField(phoneController: phoneController),
                          const SizedBox(
                            height: 10,
                          ),
                          PasswordField(passwordController: passwordController),
                          const SizedBox(
                            height: 10,
                          ),
                          ConfirmPasswordField(confirmPasswordController: confirmPasswordController, passwordController: passwordController,),
                          LoginSignupButton(
                            formKey: _formKey,
                            buttonText:
                            isSignup == true ?
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
                                isSignup = true;
                              });
                              try {
                                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text('The password provided is too weak.'),
                                  ));
                                } else if (e.code == 'email-already-in-use') {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text('The account already exists for that email.'),
                                  ));
                                }
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ThanksPage()));
                              } catch (e) {
                                setState(() {
                                  isSignup = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text('$e'),
                                ));
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


  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}





