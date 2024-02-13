import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject{
  User({
    required this.username,
    required this.mail,
    required this.phone,
    required this.password});

  @HiveField(0)
  String? username;

  @HiveField(1)
  String? mail;

  @HiveField(2)
  String? phone;

  @HiveField(3)
  String? password;

}