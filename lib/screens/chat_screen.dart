import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Muhammad Amin"
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){
              
            },
            icon: Icon(
              Icons.more_vert_rounded
            )
          )
        ],
      ),
      body: Column(
        children: [
          Spacer(),
          Container(
            color: Colors.amberAccent,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt_rounded),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextField(
                      style: TextStyle(
                        height: 1
                      ),
                      decoration: InputDecoration(
                        hintText: "Write a message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)
                        )
                      ),
                    ),
                  )
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.attachment_rounded)
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mic_none_rounded)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}