// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   late FirebaseAuth _auth;
//   final _user = Rxn<User>();
//   late Stream<User?> _authStateChanges;
//   void initAuth() async {
//     await Future.delayed(const Duration(seconds: 1));
//     _auth = FirebaseAuth.instance;
//     _authStateChanges = _auth.authStateChanges();
//     _authStateChanges.listen((User? user) {
//       _user.value = user;
//       print("....user id ${user?.email}....");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     File? _img;
//     Future _browseImage(ImageSource imageSource) async {
//       try {
//         // Source is either Gallary or Camera
//         final image = await ImagePicker().pickImage(source: imageSource);
//         if (image != null) {
//           setState(() {
//             _img = File(image.path);
//           });
//         } else {
//           return;
//         }
//       } catch (e) {
//         debugPrint(e.toString());
//       }
//     }

//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: Text(
//             'My Account',
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//           leading: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.arrow_back_ios,
//               size: 20,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         body: Container(
//           child: Text(_email ?? ''),
//         ));
//   }
// }
