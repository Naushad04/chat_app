import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreenWidget{
  BuildContext context;
  ChatScreenWidget({required this.context});

  TextEditingController messageController = TextEditingController();

  List<Map<String,dynamic>> messageList = [
    {
    'sms' : 'I am good. Con you do something for me? | need your help.',
    'time' : '1:45 AM',
    'sendBy' : 'sender',
    },
    {
    'sms' : 'I am good. Con you do something for me? | need your help.',
    'time' : '1:46 AM',
    'sendBy' : 'receiver',
    },
    {
    'sms' : 'I am good. Con you do something for me? | need your help.',
    'time' : '1:46 AM',
    'sendBy' : 'sender',
    },
  ];

  Widget chatList({ required double width, required double height}){
    return ListView.builder(
      itemCount: messageList.length,
      itemBuilder: (context, index) {
        return chatListDesign(messageList[index], width, height);
      },
    );
  }

  Widget chatListDesign(Map<String,dynamic> chat, double width, double height){
    if(chat['sendBy'] == 'sender'){
      return Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: width * 0.50,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat['sms'],
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 5,),
              Text(
                chat['time'],
                style: TextStyle(color: Colors.white,),
              ),
            ],
          ),
        ),
      );
    }
    else{
      return Align(
        alignment: Alignment.topRight,
        child: Container(
          width: width * 0.50,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              border: Border.all(color: Colors.grey.shade200, width: 1)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                chat['sms'],
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  chat['time'],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget messageSendTextField(void Function(void Function()) setState, double width, double height){
    return Container(
      width: height,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              blurStyle: BlurStyle.outer,
              offset: Offset(0,2),
            )
          ]
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: 'Write a review',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.pink),
            onPressed: () {
              
            },
          ),
        ],
      ),
    );
  }

  // sendMessage(void Function(void Function()) setState){
  //   final now = DateTime.now();
  //   final formatter = DateFormat.jm();
  //   var currentTime = formatter.format(now);
  //
  //   // for receiver
  //   var receiverMessageDetail =
  //   {
  //     'sms' : messageController.text.toString(),
  //     'time' : currentTime,
  //     'sendBy' : 'receiver',
  //   };
  //
  //   messageList.add(receiverMessageDetail);
  //
  //
  //
  //   // for receiver
  //   var senderMessageDetail =
  //   {
  //     'sms' : messageController.text.toString(),
  //     'time' : currentTime,
  //     'sendBy' : 'sender',
  //   };
  //   Timer(Duration(seconds: 1), () {
  //     setState((){
  //       messageList.add(senderMessageDetail);
  //     });
  //   });
  //
  //   messageController.clear();
  //
  //
  //
  //
  // }

}