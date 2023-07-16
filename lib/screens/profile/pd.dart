import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  final usersCollection = FirebaseFirestore.instance.collection("Users");
  Future<void> editField(String field) async {
    String newValue = '';
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Edit $field'),
              content: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Enter new $field",
                ),
                onChanged: (value) {
                  newValue = value;
                },
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel')),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(newValue),
                    child: Text('Save'))
              ],
            ));
    //update
    if (newValue.length > 0) {
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  File? _img;
  Future _browseImage(ImageSource imageSource) async {
    try {
      // Source is either Gallary or Camera
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

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
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
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
                        SizedBox(
                          height: 40,
                        ),
                        // profile image
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.grey[300],
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) => Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 122, 117, 114),
                                        onPrimary: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        elevation: 20, // Elevation
                                        shadowColor:
                                            Colors.white, // Shadow Color
                                      ),
                                      onPressed: () {
                                        _browseImage(ImageSource.camera);
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.camera,
                                      ),
                                      label: const Text('Camera'),
                                    ),
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 122, 117, 114),
                                        onPrimary: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        elevation: 20, // Elevation
                                        shadowColor:
                                            Colors.white, // Shadow Color
                                      ),
                                      onPressed: () {
                                        _browseImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.image),
                                      label: const Text('Gallery'),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                // radius: 50,
                                // backgroundColor: Color.fromARGB(255, 122, 117, 114),
                                // height: 140,
                                // width: double.infinity - 500,
                                child: _img == null
                                    ? SvgPicture.asset(
                                        "assets/icons/profile-user-svgrepo-com.svg",
                                        color:
                                            Color.fromARGB(255, 122, 117, 114),
                                        width: 95)
                                    : CircleAvatar(
                                        maxRadius: 80,
                                        minRadius: 60,
                                        backgroundColor: Colors.white,
                                        child: Image.file(_img!)),
                              ),
                              // Positioned(
                              //   right: -16,
                              //   bottom: 0,
                              //   child: SizedBox(
                              //     height: 46,
                              //     width: 46,
                              //     child: TextButton(
                              //       style: TextButton.styleFrom(
                              //         shape: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(50),
                              //           side: BorderSide(color: Colors.black),
                              //         ),
                              //         primary: Colors.black,
                              //         backgroundColor: Color(0xFFF5F6F9),
                              //       ),
                              //       onPressed: () {

                              //       },
                              //       child: SvgPicture.asset(
                              //           "assets/icons/Camera Icon.svg"),
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Center(
                            child: Row(
                          children: [
                            SizedBox(
                              width: 80,
                            ),
                            Text(
                              userData['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 35,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            GestureDetector(
                              onTap: () {
                                editField('name');
                              },
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
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
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 4.0),
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
                                                title: Row(
                                                  children: [
                                                    Text("Email"),
                                                    SizedBox(
                                                      width: 180,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        editField('email');
                                                      },
                                                      child: Icon(
                                                        Icons.edit,
                                                        size: 20,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                subtitle: Text(
                                                  userData['email'],
                                                ),
                                              ),
                                              ListTile(
                                                leading:
                                                    Icon(Icons.phone_android),
                                                title: Row(
                                                  children: [
                                                    Text("Phone Number"),
                                                    SizedBox(
                                                      width: 100,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        editField('phone');
                                                      },
                                                      child: Icon(
                                                        Icons.edit,
                                                        size: 20,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                subtitle: Text(
                                                  userData['phone'],
                                                ),
                                              ),
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
                              // Container(
                              //   height: 60,
                              //   width: 240,
                              //   decoration: BoxDecoration(
                              //     color: Color.fromARGB(255, 122, 117, 114),
                              //     borderRadius: BorderRadius.circular(18),
                              //   ),
                              //   child: TextButton(
                              //     style: ButtonStyle(
                              //       overlayColor:
                              //           MaterialStateProperty.resolveWith(
                              //         (states) => Colors.black12,
                              //       ),
                              //     ),
                              //     onPressed: () {
                              //       Navigator.push(
                              //         context,
                              //         CupertinoPageRoute(
                              //           builder: (context) => EditProfileScreen(),
                              //         ),
                              //       );
                              //     },
                              //     child: Text(
                              //       "",
                              //       style:
                              //           kButtonText.copyWith(color: Colors.white),
                              //     ),
                              //   ),
                              // )
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
      ),
    );
  }
}
