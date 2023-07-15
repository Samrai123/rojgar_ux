import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rojgar/screens/notification.dart';
import 'package:rojgar/screens/profile/change_region.dart';
import 'package:rojgar/screens/profile/eidt_profile.dart';
import 'package:rojgar/screens/profile/pd.dart';
import 'package:rojgar/screens/profile/profile_display.dart';
import 'package:rojgar/screens/screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(
            text: "My Account",
            icon: "assets/icons/profile-user-svgrepo-com.svg",
            press: () => {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => CreateProfileScreen(),
                ),
              )
            },
          ),
          // SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ProfiileS(),
                ),
              )
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => NotificationScreen(),
                ),
              );
            },
          ),
          // ProfileMenu(
          //   text: "About Us",
          //   icon: "assets/icons/Settings.svg",
          //   press: () {
          //     Navigator.push(
          //       context,
          //       CupertinoPageRoute(
          //         builder: (context) => GoogleMapScreenState(),
          //       ),
          //     );
          //   },
          // ),
          ProfileMenu(
            text: "Change Region",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ChangeRegionScreen(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => SignInPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
