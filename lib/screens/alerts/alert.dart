import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:rojgar/screens/home/job_detail.dart';
import 'package:rojgar/screens/saved/apply_job.dart';

import '../../app/controller.dart';
import '../home/data.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  List<Job> jobs = getJobs;
  final JobController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Job Alerts',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(
        //     Icons.arrow_back_ios,
        //     size: 20,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 32),
                //   child: Container(
                //     height: 60,
                //     decoration: BoxDecoration(
                //       color: Color.fromARGB(255, 122, 117, 114),
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: TextButton(
                //             style: TextButton.styleFrom(),
                //             child: Text(
                //               "Saved",
                //               style:
                //                   TextStyle(color: Colors.white, fontSize: 18),
                //             ),
                //             onPressed: () {},
                //           ),
                //         ),
                //         Expanded(
                //           child: TextButton(
                //             style: TextButton.styleFrom(

                //                 // Background color
                //                 ),
                //             child: Text(
                //               "Applied",
                //               style:
                //                   TextStyle(color: Colors.white, fontSize: 18),
                //             ),
                //             onPressed: () {
                //               Navigator.push(
                //                   context,
                //                   CupertinoPageRoute(
                //                     builder: (context) => ApplyJobs(),
                //                   ));
                //             },
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                    itemCount: controller.job.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SavedJobScreen(
                          controller: controller,
                          job: controller.job.keys.toList()[index],
                          index: index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SavedJobScreen extends StatefulWidget {
  final JobController controller;
  final Job job;
  final int index;

  SavedJobScreen(
      {Key? key,
      required this.controller,
      required this.job,
      required this.index})
      : super(key: key);

  @override
  State<SavedJobScreen> createState() => _SavedJobScreenState();
}

class _SavedJobScreenState extends State<SavedJobScreen> {
  var size, height, width;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          context: context,
          isScrollControlled: true,
          builder: (builder) {
            return JobDetail(job: widget.job);
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.job.logo),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.job.position,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.job.company,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )),
            Container(
              child: FlutterSwitch(
                  height: 30,
                  width: 60,
                  value: isSwitched,
                  onToggle: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
