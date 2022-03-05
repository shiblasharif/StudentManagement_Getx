import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:student_management/database/model/model.dart';

class StudentController extends GetxController {
   Box<Model> box = Hive.box<Model>('records');
  int selectedInddex = 0;
  void addnewstudent(String name, int age, String domain, int phone, picture) {
    Model details = Model(
        name: name, age: age, domain: domain, phone: phone, imagePath: picture);
    box.add(details);
    update();
  }
}

class StudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StudentController());
  }
}
