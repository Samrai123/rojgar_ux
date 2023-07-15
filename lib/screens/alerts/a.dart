import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlutterSwitch(
          value: isSwitched,
          onToggle: (value) {
            setState(() {
              isSwitched = value;
            });
          }),
    );
  }
}
