import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:rojgar/screens/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:rojgar/widgets/snackbar.dart';

import '../widgets/widget.dart';
import '../widgets/constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  bool isPasswordVisible = true;

  bool passwordVisibility = true;
  Future register() async {
    try {
      firebase_auth.UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // add user details
      FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.email)
          .set({
        'email': _emailController.text,
        'name': _nameController.text,
        'phone': _phoneController.text
      });
      showSnackbar(context, 'Your Regitser has been successfull done',
          Color.fromARGB(255, 117, 244, 54));
    } catch (e) {
      final snackbar = SnackBar(content: Text('Oops... Something went wrong'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  // Future addUserDetails(String name, String email, String phoneNumber) async {
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'name': name,
  //     'email': email,
  //     'phone number': phoneNumber,
  //   });
  // }

  _goToAnotherPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image(
            width: 24,
            color: const Color.fromARGB(255, 9, 8, 8),
            image: Svg('assets/images/back_arrow.svg'),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 30,
              ),
              child: Column(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello! ",
                          style: kHeadline,
                        ),
                        Text(
                          "Register to get started",
                          style: kBodyText2,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        // TextFormField(
                        //   style: kBodyText.copyWith(
                        //       color: const Color.fromARGB(255, 21, 21, 21)),
                        //   keyboardType: TextInputType.emailAddress,
                        //   controller: _nameController,
                        //   textInputAction: TextInputAction.next,
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return 'Please enter your first name.';
                        //     }
                        //     return null;
                        //   },
                        //   decoration: InputDecoration(
                        //     contentPadding: EdgeInsets.all(20),
                        //     hintText: "Enter Name",
                        //     hintStyle: kBodyText,
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(
                        //         color: Colors.grey,
                        //         width: 1,
                        //       ),
                        //       borderRadius: BorderRadius.circular(18),
                        //     ),
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(
                        //         color: Color.fromARGB(255, 144, 53, 0),
                        //         width: 1,
                        //       ),
                        //       borderRadius: BorderRadius.circular(18),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          style: kBodyText.copyWith(
                              color: const Color.fromARGB(255, 21, 21, 21)),
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            hintText: "Enter Email",
                            hintStyle: kBodyText,
                            labelText: 'Email',
                            labelStyle:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 144, 53, 0),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          style: kBodyText.copyWith(
                              color: const Color.fromARGB(255, 21, 21, 21)),
                          keyboardType: TextInputType.emailAddress,
                          controller: _phoneController,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (_passwordController.text.length > 8 &&
                                _passwordController.text != value) {
                              return 'Passwords do not match.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            hintText: "Enter Phone Number",
                            hintStyle: kBodyText,
                            labelText: 'Phone Number',
                            labelStyle:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 144, 53, 0),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          style: kBodyText.copyWith(
                              color: const Color.fromARGB(255, 21, 21, 21)),
                          keyboardType: TextInputType.emailAddress,
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                          // validator: (value) {
                          //   if (_passwordController.text.length > 8 &&
                          //       _passwordController.text != value) {
                          //     return 'Passwords do not match.';
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            hintText: "Enter Full Name",
                            hintStyle: kBodyText,
                            labelText: 'Full Name',
                            labelStyle:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 144, 53, 0),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          style: kBodyText.copyWith(
                            color: const Color.fromARGB(255, 18, 17, 17),
                          ),
                          obscureText: isPasswordVisible,
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {},
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.all(20),
                            hintText: 'Password',
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            hintStyle:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 144, 53, 0),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Already have an account? ",
                        style: kBodyText,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => SignInPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: kBodyText.copyWith(
                            color: Color.fromARGB(255, 18, 13, 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 122, 117, 114),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.black12,
                        ),
                      ),
                      onPressed: () {
                        register();
                      },
                      child: Text(
                        "Register",
                        style: kButtonText.copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
