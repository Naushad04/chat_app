
import 'package:chat_app/view/screen/people_screen/people_screen_widget.dart';
import 'package:flutter/material.dart';


class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen>{
  List<Map<String,dynamic>> peopleList = [
    {
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwZG0c1r7NwrALFtXh6SwfJljueGFW1ZI7xw&s',
      'name' : 'Jose Lowe',
      'follower' : 156
    },
    {
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZbSgxh7B_XqgjhQlMCIeoUgAOvKcNprFZBg&s',
      'name' : 'Naushad Alam',
      'follower' : 126
    },
    {
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh7ogUYtR66AVscPGclBkMHRagtzJ9D0w04Q&s',
      'name' : 'Louise Lyons',
      'follower' : 120
    },
    {
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgX-eWiwaI_NLV7CnX6on19zG4f2P_-VIpiw&s',
      'name' : 'Hulda james',
      'follower' : 196
    },
    {
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_pXJOg3LC5UiFZGw5AsAfAFXAp816NjI-IA&s',
      'name' : 'Matilde MCGuire',
      'follower' : 856
    },
    {
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZbSgxh7B_XqgjhQlMCIeoUgAOvKcNprFZBg&s',
      'name' : 'Naushad Alam',
      'follower' : 780
    },
    {
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh7ogUYtR66AVscPGclBkMHRagtzJ9D0w04Q&s',
      'name' : 'Louise Lyons',
      'follower' : 216
    },
  ];

  @override
  Widget build(BuildContext context) {
    var view = PeopleScreenWidget(context: context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 10.0),
            child: Icon(Icons.search, color: Colors.white,),
          )
        ],
        title: Text(
          'People',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: view.getAllUserData(width: width, height: height),
    );
  }
}
