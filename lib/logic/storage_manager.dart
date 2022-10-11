import 'package:shared_preferences/shared_preferences.dart';

getText(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('counter');
  // print('Pressed $counter times.');
  // await prefs.setInt('counter', counter);
}

changeText(String name, text) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt(name, text);
}
