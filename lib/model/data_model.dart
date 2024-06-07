import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


part 'data_model.g.dart';

@HiveType(typeId: 0)
class DataModel {
  @HiveField(0)
  String username;

  @HiveField(1)
  String password;

  DataModel({required this.username, required this.password});
}
