import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/view/screen/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String _selectedOption = "";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: width,
            height: height,
            child: StreamBuilder(
              stream: AuthController().getUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return buildShimmerEffect(width, height);
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error fetching user data'));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('No user data found'));
                }

                var user = snapshot.data?.first;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: height * 0.09),
                            Image.network(
                              user!.image!,
                              height: height * 0.37,
                              width: width,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                        Container(
                          width: width,
                          height: height * 0.18,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.blue.shade500,
                                Colors.transparent
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'My profile',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              IconButton(
                                onPressed: () {
                                  popupMenu();
                                },
                                icon: Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                user.name!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(width: width * 0.02),
                              Text(
                                user.age!,
                                style: TextStyle(color: Colors.black, fontSize: 18),
                              ),
                              SizedBox(width: width * 0.02),
                              Container(
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.orange),
                              )
                            ],
                          ),
                          Text(
                            user.bio!,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  SizedBox(width: width * 0.02),
                                  Text(
                                    user.address!,
                                    style: TextStyle(color: Colors.black54),
                                  )
                                ],
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.grey,
                                size: 20,
                              ),
                              SizedBox(width: width * 0.02),
                              Text(
                                user.maritalStatus!,
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                          Row(
                            children: [
                              Icon(
                                Icons.email,
                                color: Colors.grey,
                                size: 20,
                              ),
                              SizedBox(width: width * 0.02),
                              Text(
                                user.email!,
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            logoutDialog(height, width, context);
          },
          child: Text(
            'Logout',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              minimumSize: Size(width * 0.9, height * 0.055)),
        )
      ],
    );
  }

  /// Build Shimmer Effect when data is loading
  Widget buildShimmerEffect(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: width,
            height: height * 0.37,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: width * 0.4,
                  height: 20,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: width * 0.6,
                  height: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: width * 0.8,
                  height: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void logoutDialog(double height, double width, BuildContext context) {
    Get.dialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionCurve: Curves.easeOutCirc,
      transitionDuration: Duration(seconds: 1),
      barrierDismissible: false,
      Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: height * 0.16,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                color: Colors.blue,
              ),
              child: Icon(
                Icons.error_outline_outlined,
                size: 60,
                color: Colors.red,
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              'Are You Sure?',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Text(
              'Do you want to logout',
              style: TextStyle(
                  color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(width * 0.25, height * 0.050),
                      elevation: 0),
                ),
                ElevatedButton(
                  onPressed: () {
                    _auth.signOut().then((onValue) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    });
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(width * 0.35, height * 0.050),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                )
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  popupMenu() {
    PopupMenuButton<String>(
      onSelected: (String value) {
        if (value == 'Edit Profile') {
          // Handle Edit Profile action
          print('Edit Profile selected');
        } else if (value == 'Logout') {
          // Handle Logout action
          print('Logout selected');
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'Edit Profile',
          child: ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Profile'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Logout',
          child: ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
          ),
        ),
      ],
    );
  }
}
