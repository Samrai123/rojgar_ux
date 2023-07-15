import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rojgar/screens/profile/components/constants.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);
  final String text, icon;
  final VoidCallback? press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          fixedSize: const Size(400, 100),
          primary: Colors.white,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color.fromARGB(255, 122, 117, 114),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: Colors.white,
              width: 55,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.edit),
          ],
        ),
      ),
    );
  }
}
