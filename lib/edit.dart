import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:student_management/controller/controller.dart';
import 'package:student_management/database/model/model.dart';
import 'package:student_management/search.dart';

class edit extends StatelessWidget {
  edit({Key? key, required this.student, required this.index})
      : super(key: key);
  Model student;
  int index;

  Box<Model> box = Hive.box<Model>('records');

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
          return Form(
              child: ListView(
            children: [
              const Padding(padding: EdgeInsets.only(left: 10, top: 10)),
              Text(' Name:',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: student.name,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Name',
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Name required";
                    }
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      student.name = (value);
                    }
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 10, top: 10)),
              Text(' Age:',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: student.age.toString(),
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Student Age',
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Student Age required";
                    }
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      student.age = int.parse(value);
                    }
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 10, top: 10)),
              Text(' Domain:',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: student.domain,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Domain',
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Domain required";
                    }
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      student.domain = (value);
                    }
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 10, top: 10)),
              Text(' Phone No.:',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: student.phone.toString(),
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Phone No.',
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Phone No. required";
                    }
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      student.phone = int.parse(value);
                    }
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 10, top: 10)),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Search()),
                  //     (route) => false);
                  Get.back();

                  student.save();
                  controller.update();
                },
                child: Text(
                  'Submit',
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white24,
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ));
        }));
  }
}
