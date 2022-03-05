import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management/controller/controller.dart';
import 'package:student_management/database/model/model.dart';

import 'package:student_management/search.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ModelAdapter());
  await Hive.openBox<Model>('records');
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    //home: Search(),
     getPages: [
        GetPage(name: "/home", page: () => Search(), binding: StudentBinding())
      ],
      initialRoute: "/home",
  ));
}
