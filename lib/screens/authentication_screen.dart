import 'package:first_app/screens/login.dart';
import 'package:first_app/screens/signup.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 400),
      curve: Curves.ease
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: _currentPage == 0 ? Alignment.centerRight : Alignment.centerLeft,
          children: [
            Center(
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: [
                  LoginPage(),
                  SignupPage(),
                ],

              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_currentPage == 0 ? 16 : 0),
                  bottomLeft: Radius.circular(_currentPage == 0 ? 16 : 0),
                  topRight: Radius.circular(_currentPage == 0 ? 0 : 16),
                  bottomRight: Radius.circular(_currentPage == 0 ? 0 : 16)
                ),
                color: Colors.grey
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      _currentPage == 0 ? Icons.swipe_right_alt_rounded : Icons.swipe_left_alt_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 8),
                    child: Text(
                      _currentPage == 0 ? 'S\ni\ng\nn\n \nU\np' : 'L\no\ng\n \nI\nn\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  )
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}