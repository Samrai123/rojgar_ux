import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rojgar/screens/profile/components/constants.dart';

class ChangeRegionScreen extends StatelessWidget {
  const ChangeRegionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Choose Region',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Regions",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.flag,
                      color: kPrimaryColor,
                      size: 22,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: Text("USA", style: TextStyle(fontSize: 18))),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.flag,
                      color: kPrimaryColor,
                      size: 22,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: Text("United Kingdon",
                            style: TextStyle(fontSize: 18))),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.flag,
                      color: kPrimaryColor,
                      size: 22,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: Text("India", style: TextStyle(fontSize: 18))),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.flag,
                      color: kPrimaryColor,
                      size: 22,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: Text("Nepal", style: TextStyle(fontSize: 18))),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.flag,
                      color: kPrimaryColor,
                      size: 22,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: Text("China", style: TextStyle(fontSize: 18))),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
