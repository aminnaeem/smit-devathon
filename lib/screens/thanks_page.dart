import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class ThanksPage extends StatelessWidget {
  ThanksPage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 300,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 60,
                  ),
                  Text(
                    "Muhammad Amin",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "Friends: 45",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_2_rounded),
              title: Text(
                "Profile"
              ),
            ),
            ListTile(
              leading: Icon(Icons.people_rounded),
              title: Text(
                "Friends List"
              ),
            ),
            ListTile(
              leading: Icon(Icons.data_exploration_rounded),
              title: Text(
                "Data Usage"
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings"
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Log Out"
              ),
              onTap: () async {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: Icon(Icons.person)
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search)
            ),
            Text(
              "Chat"
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.person_add)
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz)
                ),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 24,
              ),
              title: Text(
                "Muhammad Amin",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w800
                ),
              ),
              subtitle: Text(
                "1 new message"
              ),
              trailing: Text(
                "09:00 PM"
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ChatScreen()));
              },
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          
        },
      ),
    );
  }
}