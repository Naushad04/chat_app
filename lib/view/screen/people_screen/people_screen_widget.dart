import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../chat_screen/chat_screen.dart';

class PeopleScreenWidget {
  BuildContext context;

  PeopleScreenWidget({required this.context});

  getAllUserData({required double width, required double height}) {
    return StreamBuilder(
      stream: AuthController().getAllUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return shimmerEffect(width: width, height: height);
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No users found'));
        }

        return reviewList(userList: snapshot.data, width: width, height: height);
      },
    );
  }

  reviewList({required List<UserModel>? userList, required double width, required double height}) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: userList?.length,
      itemBuilder: (context, index) {
        return reviewListDesign(user: userList![index], width: width, height: height);
      },
    );
  }

  reviewListDesign({required UserModel user, required double width, required double height}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, _createRoute(user.name!));
      },
      child: Container(
        width: width,
        color: Colors.white,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    user.image!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name!,
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 3),
                    Text(user.bio!),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Route _createRoute(String name) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ChatScreen(name: name),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.3, 1.3);
        const end = Offset.zero;
        const curve = Curves.linearToEaseOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 800),
      reverseTransitionDuration: Duration(milliseconds: 800),
    );
  }

  /// Shimmer effect when data is loading
  shimmerEffect({required double width, required double height}) {
    return ListView.builder(
      itemCount: 6, // Show 6 shimmer items while loading
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: width,
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        color: Colors.grey[300],
                        width: 60,
                        height: 60,
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.4,
                          height: 15,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: width * 0.2,
                          height: 15,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
