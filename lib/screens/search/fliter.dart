import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // List<String> countList = [
  //   "One",
  //   "Two",
  //   "Three",
  // ];
  // List<String> selectedCountList = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Container(
        child: Column(children: [
          Center(
            child: Text(
              "Filter",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: ["UI Design", "Development", "Business", 'Data Clerk'],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Category",
                hintText: "Jobs ",
              ),
            ),
            onChanged: print,
            selectedItem: "UI Design",
          ),
          SizedBox(
            height: 10,
          ),
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: ["UI Design", "Development", "Business", 'Data Clerk'],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Sub Category",
                hintText: "Jobs ",
              ),
            ),
            onChanged: print,
            selectedItem: "UI Design",
          ),
          SizedBox(
            height: 10,
          ),
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: ["Part Time", "Full Time", "Intern", 'Remote'],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Job Type",
                hintText: "Jobs ",
              ),
            ),
            onChanged: print,
            selectedItem: "Part Time",
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 122, 117, 114),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Apply Now",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
