// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:student_management/controller/controller.dart';
import 'package:student_management/database/model/model.dart';

import 'package:student_management/search.dart';

import 'edit.dart';

class View extends StatelessWidget {
  View({Key? key, required this.student, required this.index})
      : super(key: key);
  Box<Model> box = Hive.box<Model>('records');
  Model student;
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(95, 126, 120, 120),
          title: Text(
            student.name!,
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        body: GetBuilder<StudentController>(builder: (controller) {
          return ListView(
            children: [
              const Padding(padding: EdgeInsets.only(left: 15, top: 30)),
              CircleAvatar(
                maxRadius: 50,
                backgroundColor: Colors.grey,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: Image.file(File(student.imagePath)).image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
              Text('          Name:            ' + student.name!,
                  style: const TextStyle(color: Colors.black, fontSize: 22)),
              const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              Text('          Age:               ' + student.age.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 22)),
              const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              Text('          Domain:        ' + student.domain.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 22)),
              const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              Text('         Phone No.:   ' + student.phone.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 22)),
              const Padding(padding: EdgeInsets.fromLTRB(0, 200, 0, 0)),
              FloatingActionButton(
                  onPressed: () async {
                    await box.deleteAt(index);
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(),
                        ));
                    controller.update();
                  },
                  child: const Icon(Icons.delete),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white24),
              const SizedBox(
                height: 5,
              ),
              FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => edit(
                  //         student: student,
                  //         index: index,
                  //       ),
                  //     ));
                  Get.to(() => edit(
                        student: student,
                        index: index,
                      ));
                },
                child: const Text('Update'),
                foregroundColor: Colors.white,
                backgroundColor: Colors.white24,
              ),
            ],
          );
        }));
  }
}
