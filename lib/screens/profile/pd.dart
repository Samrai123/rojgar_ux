import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rojgar/screens/profile/eidt_profile.dart';
import 'package:rojgar/widgets/constants.dart';

import '../../widgets/theme_helper.dart';

class ProfiileS extends StatefulWidget {
  const ProfiileS({super.key});

  @override
  State<ProfiileS> createState() => _ProfiileSState();
}

class _ProfiileSState extends State<ProfiileS> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  Future<void> editField(String Field) async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Account',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(currentUser.email)
              .snapshots(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return Container(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // profile image
                      GestureDetector(
                        // onTap: () async {
                        //   var source = ImageSource.gallery;
                        //   XFile image = await imagePicker.pickImage(
                        //       source: source,
                        //       imageQuality: 50,
                        //       preferredCameraDevice: CameraDevice.front);
                        //   setState(() {
                        //     UpdateProfileImage.setImage(File(image.path));
                        //   });
                        // },
                        child: SizedBox(
                            width: 200,
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              // child: Image.network(
                              //   Constant.userImageURL + profileResponse.image!,
                              // ),
                            )),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Center(
                          child: Text(
                        userData['name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 35,
                            color: Colors.black),
                      )),
                      const SizedBox(
                        height: 12,
                      ),
                      Center(
                          child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 4.0),
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "MY Information",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Card(
                              child: Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        ...ListTile.divideTiles(
                                          color: Colors.grey,
                                          tiles: [
                                            ListTile(
                                              leading: Icon(Icons.email),
                                              title: Text("Email"),
                                              subtitle: Text(
                                                userData['email'],
                                              ),
                                            ),
                                            ListTile(
                                              leading:
                                                  Icon(Icons.phone_android),
                                              title: Text("Phone Number"),
                                              subtitle: Text(
                                                userData['phone'],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              height: 60,
                              width: 240,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 122, 117, 114),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: TextButton(
                                style: ButtonStyle(
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) => Colors.black12,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) =>
                                          CreateProfileScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Edit Profile",
                                  style:
                                      kButtonText.copyWith(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                      const SizedBox(
                        height: 12,
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error${snapshot.error}'));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          })),
    );
  }
}
