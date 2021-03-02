import 'package:bank_extract_app/util/constant/constant_db.dart';
import 'package:hive/hive.dart';

part 'login.g.dart';

@HiveType(typeId: ConstantDb.loginId)
class Login extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String password;

  @HiveField(3)
  String tokenAccess;

  Login({this.id, this.name, this.password, this.tokenAccess});

  @override
  String toString() {
    return name;
  }
}
