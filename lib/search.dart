import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management/add.dart';
import 'package:student_management/controller/controller.dart';
import 'package:student_management/database/model/model.dart';

import 'package:student_management/view.dart';

// ignore: must_be_immutable
class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);

  String searchText = "";

  Box<Model> box = Hive.box<Model>('records');

  @override
  Widget build(BuildContext context) {
    final studentController = Get.find<StudentController>();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Add(),
            //     ));
            Get.to(() => Add());
          },
          child: const Icon(Icons.add),
          foregroundColor: Colors.blueGrey[400],
          backgroundColor: Colors.blueGrey[200],
        ),
        backgroundColor: Colors.white24,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(95, 126, 120, 120),
          title: const Text(
            "Students Details",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            GetBuilder<StudentController>(builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 10, right: 10),
                child: TextFormField(
                  autofocus: false,
                  style: const TextStyle(fontSize: 19.0, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Search a Student",
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    searchText = value;
                    //controller.update(["1"]);
                    studentController.update();
                  },
                ),
              );
            }),
            Expanded(
              child: GetBuilder<StudentController>(
                builder: (controller) {
                  //  valueListenable: Hive.box<Model>('records').listenable(),
                  // builder: (context, Box<Model> box, _)

                  // List<Model> students = box.values.toList();
                  // if (box.values.isEmpty) {
                  //   return const Center(
                  //     child: Text(
                  //       'No results found!',
                  //       style: TextStyle(color: Colors.black, fontSize: 22),
                  //     ),
                  //   );
                  // }

                  // List<Model> result = students
                  //     .where((element) => element.name!
                  //         .toLowerCase()
                  //         .contains(searchText.toLowerCase()))
                  //     .toList();
                  List<Model> results = searchText.isEmpty
                      ? controller.box.values.toList()
                      : controller.box.values
                          .where((element) => element.name!
                              .toLowerCase()
                              .contains(searchText.toLowerCase()))
                          .toList();
                  if (results.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          "No data available",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        // onTap: () => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => View(
                        //             student: result[index], index: index))),
                        //tileColor: Colors.white24,

                        onTap: () {
                          Get.to(() =>
                              View(student: results[index], index: index));
                        },

                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: Image.file(File(
                                        results[index].imagePath.toString()))
                                    .image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        title: Text(results[index].name!),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
