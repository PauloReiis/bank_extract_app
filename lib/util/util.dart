import 'package:bank_extract_app/model/entity/login.dart';
import 'package:bank_extract_app/util/constant/constant_db.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path_helper;

/// **Conceito:** Metodos utils
/// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
class Util {

  /// **Conceito:** Inicializando banco Hive
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  static Future initHive([String subDir]) async {
    WidgetsFlutterBinding.ensureInitialized();
    if (!kIsWeb) {
      var appDir = await getApplicationDocumentsDirectory();
      var path = appDir.path;
      if (subDir != null) {
        path = path_helper.join(path, subDir);
      }
      Hive.init(path);
    }
    //Registrando e abrindo as box
    Hive.registerAdapter(LoginAdapter());
    await Hive.openBox<Login>(ConstantDb.loginBox);
  }
}