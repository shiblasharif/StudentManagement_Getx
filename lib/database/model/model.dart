import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 4)
class Model extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? age;
  @HiveField(2)
  String? domain;
  @HiveField(3)
  int? phone;
  @HiveField(4)
  dynamic imagePath;
  Model({this.name, this.age, this.domain, this.phone, this.imagePath});
}
