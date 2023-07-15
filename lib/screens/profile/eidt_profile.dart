import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rojgar/screens/profile/profile_screen.dart';
import 'package:rojgar/widgets/constants.dart';
import 'package:rojgar/widgets/header_widge.dart';
import 'package:rojgar/widgets/snackbar.dart';
import 'package:rojgar/widgets/theme_helper.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});
  static const String route = "registerScreen";
  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  // @override
  // void initState() {
  //   super.initState();

  //   checkPermission();
  // }

  // void show() {
  //   showSnackbar(context, 'Token : ${Constant.token}', Colors.yellow);
  // }

  // checkPermission() async {
  //   await UserPermission.checkCameraPermission();
  // }

  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: 'Sam');
  final _lnameController = TextEditingController(text: 'Rai');
  final _usernameController = TextEditingController(text: 'samrai');
  final _phonenumberController = TextEditingController(text: '1234567890');
  final _emailController = TextEditingController(text: 'samrai@gmail.com');

  // _saveUser() async {
  //   User user = User(
  //     fname: _fnameController.text,
  //     lname: _lnameController.text,
  //     email: _emailController.text,
  //     username: _usernameController.text,
  //     password: _passwordController.text,
  //   );

  //   user.category.addAll(_lstCategorySelected);

  //   int status = await UserRepositoryImpl().addAllUser(_img, user);
  //   _showMessage(status);
  // }

  _goToAnotherPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ProfileScreen()));
  }

  _showMessage(int status) {
    if (status > 0) {
      _goToAnotherPage();
      showSnackbar(context, 'User Successfully Added',
          Color.fromARGB(255, 117, 244, 54));
    } else {
      showSnackbar(context, 'Failed to Add User', Colors.red);
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
          'Create Profile',
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Container(
            //   height: 150,
            //   child: const HeaderWidget(
            //       150, false, Icons.person_add_alt_1_rounded),
            // ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // const SizedBox(
                        //   height: 5,
                        // ),
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
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Color.fromARGB(255, 122, 117, 114),
                            // height: 140,
                            // width: double.infinity - 500,
                            child: _img == null
                                ? SvgPicture.asset(
                                    "assets/icons/profile-user-svgrepo-com.svg",
                                    color: Colors.white,
                                    width: 95)
                                : Image.file(_img!),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            onChanged: (value) {},
                            controller: _fnameController,
                            // key: const Key('txtFname'),
                            decoration: ThemeHelper().textInputDecoration(
                                'First Name', 'Enter your first name'),
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter first name';
                              }
                              return null;
                            }),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _lnameController,
                            // key: const Key('txtLname'),
                            decoration: ThemeHelper().textInputDecoration(
                                'Last Name', 'Enter your last name'),
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Last name';
                              }
                              return null;
                            }),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Enter your email"),
                            // key: const Key('txtEmail'),
                            keyboardType: TextInputType.emailAddress,
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            }),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _usernameController,
                            // key: const Key('txtUsername'),
                            decoration: ThemeHelper().textInputDecoration(
                                'Username', 'Enter your username'),
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter username';
                              }
                              return null;
                            }),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _phonenumberController,
                            // key: const Key('txtUsername'),
                            decoration: ThemeHelper().textInputDecoration(
                                'Phone number', 'Enter your phone number'),
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter phone number';
                              }
                              return null;
                            }),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const SizedBox(height: 15.0),
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
                            onPressed: () {},
                            child: Text(
                              "Create Account",
                              style: kButtonText.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        const SizedBox(height: 25.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
