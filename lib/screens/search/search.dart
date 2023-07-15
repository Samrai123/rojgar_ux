import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rojgar/screens/home/data.dart';
import 'package:rojgar/screens/home/job_detail.dart';
import 'package:rojgar/screens/home/jobs.dart';
import 'package:rojgar/screens/search/fliter.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Job> jobs = getJobs;
  void searchJob(String query) {
    final suggestions = getJobs.where((job) {
      final jobPosition = job.position.toLowerCase();
      final input = query.toLowerCase();
      return jobPosition.contains(input);
    }).toList();
    setState(
      () => jobs = suggestions,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Search',
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
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(right: 32, left: 32, top: 8, bottom: 20),
            child: Row(children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => SearchPage(),
                      ),
                    );
                  },
                  child: TextField(
                    onChanged: searchJob,
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SearchPage(),
                              ),
                            );
                          },
                          child: Icon(Icons.search)),
                      hintText: "Search",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none),
                      fillColor: Color(0xffe6e6ec),
                      filled: true,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 122, 117, 114),
                  borderRadius: BorderRadius.circular(9.0),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.tune,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        context: context,
                        builder: (builder) {
                          return FilterPage();
                        });
                  },
                ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              "Job Opportunity",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: buildLastJobs(),
            ),
          ),
        ]),
      ),
    );
  }

  List<Widget> buildLastJobs() {
    List<Widget> list = [];
    for (var i = jobs.length - 1; i > -1; i--) {
      list.add(buildLastJob(jobs[i]));
    }
    return list;
  }

  Widget buildLastJob(Job job) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          context: context,
          isScrollControlled: true,
          builder: (builder) {
            return JobDetail(job: job);
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
                  image: AssetImage(job.logo),
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
                    job.position,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    job.company,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )),
            Text(
              r"$" + job.price + "/h",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
