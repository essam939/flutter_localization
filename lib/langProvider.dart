import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangProvider extends ChangeNotifier{

  _saveInPrefrence(String languageCode) async {
    print("kkkkk ${languageCode}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language_cade", languageCode);
    getPrefrence();

  }

  getPrefrence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    code = prefs.getString("language_cade")!;
    print("lllll ${code}");
    if (code == null) {
      code = "en";
      notifyListeners();
    }
    notifyListeners();
  }

  late Locale _local = Locale("en");
  late String code = "en";

  Locale get local => _local;

  set local(Locale value) {
    _local = value;
    _saveInPrefrence(value.languageCode);
    notifyListeners();
  }
}