import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management/controller/controller.dart';
import 'package:student_management/database/model/model.dart';

class Add extends StatelessWidget {
  Add({Key? key}) : super(key: key);

  String? _name;

  int? _age;

  String? _domain;

  int? _phone;

  dynamic _pic;

  final _formKey = GlobalKey<FormState>();
  Box<Model> box = Hive.box<Model>('records');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:const Color.fromARGB(95, 126, 120, 120),
          title: const Text(
            "Add new Student",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        body: Form(
            key: _formKey,
            child: ListView(children: [
              const Padding(padding: EdgeInsets.only(left: 15, top: 10)),
              const Text('Name:',
                  style: TextStyle(color: Colors.black, fontSize: 22)),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, bottom: 10, top: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length > 2) {
                      _name = value;
                      return null;
                    } else if (value.length < 3) {
                      return 'Plear Enter a name';
                    }
                    return null;
                  },
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontSize: 19.0, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
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
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              const Text('Age',
                  style: TextStyle(color: Colors.black, fontSize: 22)),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, bottom: 10, top: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length == 2 || value.length == 1) {
                      _age = int.parse(value);
                      return null;
                    }
                    return 'Please enter Age';
                  },
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 19.0, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter Age',
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
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              const Text('Domain',
                  style: TextStyle(color: Colors.black, fontSize: 22)),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, bottom: 10, top: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length > 3) {
                      _domain = value;
                      return null;
                    } else if (value.length < 2) {
                      return 'Enter a valid domain';
                    }
                    return null;
                  },
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 19.0, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter Domain',
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
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              const Text('Phone No.',
                  style: TextStyle(color: Colors.black, fontSize: 22)),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, bottom: 10, top: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length == 10) {
                      _phone = int.parse(value);
                      return null;
                    }
                    return "Enter valid number";
                  },
                  autofocus: false,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontSize: 19.0, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter Phone No.',
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
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: ElevatedButton(
                  child: const Text("Select Image"),
                  onPressed: () async {
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      _pic = image.path;
                    }
                    return;
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white24,
                      textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GetBuilder<StudentController>(builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text("Add"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                        box.add(Model(
                            name: _name,
                            age: _age,
                            domain: _domain,
                            phone: _phone,
                            imagePath: _pic));
                      }
                      controller.update();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white24,
                        textStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                );
              }),
            ])));
  }
}
