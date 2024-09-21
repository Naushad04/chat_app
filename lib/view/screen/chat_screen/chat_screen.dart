
import 'package:flutter/material.dart';

import 'chat_screen_widget.dart';

class ChatScreen extends StatefulWidget {
  String name;
  ChatScreen({super.key, required this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var view = ChatScreenWidget(context: context);

    setState(() {

    });
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Expanded(
                child: view.chatList(width: width, height: height)
            ),
            view.messageSendTextField(setState, width, height)
          ],
        ),
      ),
    );
  }
}

