import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:rojgar/screens/bottom_navibar.dart';

import 'package:rojgar/screens/home_screen.dart';
import 'package:rojgar/widgets/snackbar.dart';
import '../widgets/constants.dart';
import '../screens/screen.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../widgets/widget.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordVisible = true;
  _signIn() async {
    try {
      firebase_auth.UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      print(userCredential.user!.email);
      showSnackbar(
          context, 'Successfully Logged In', Color.fromARGB(255, 117, 244, 54));
      _goToAnotherPage();
    } catch (e) {
      final snackbar = SnackBar(content: Text('Oops... Something went wrong'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  _goToAnotherPage() {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => BottomNavigationBarScreen(),
      ),
    );
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
      body: SafeArea(
        //to make page scrollable
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome !",
                            style: kHeadline,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Glad to see you!",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextField(
                                  style: kBodyText.copyWith(
                                      color: const Color.fromARGB(
                                          255, 21, 21, 21)),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    hintText: "Enter Email",
                                    hintStyle: kBodyText,
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
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
                                    color:
                                        const Color.fromARGB(255, 18, 17, 17),
                                  ),
                                  obscureText: isPasswordVisible,
                                  controller: _passwordController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
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
                                    hintStyle: kBodyText,
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
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
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Don't have an account? ",
                                style: kBodyText,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Register',
                                  style: kBodyText.copyWith(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
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
                                _signIn();
                                // if (_formKey.currentState!.validate()) {
                                //   _login();
                                // }
                                // Navigator.push(
                                //   context,
                                //   CupertinoPageRoute(
                                //     builder: (context) => HomeScreen(),
                                //   ),
                                // );
                              },
                              child: Text(
                                "Sign In",
                                style:
                                    kButtonText.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
