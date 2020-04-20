import 'package:shared_preferences/shared_preferences.dart';
import 'temp_var.dart' as globalTemp;
import 'account_information.dart' as account_info;

final String emailKey = "user_email";
final String passwordKey = "user_password";
final String roleKey = "user_role";

setSession(String email, String password, String role) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(emailKey, email);
  prefs.setString(passwordKey, password);
  prefs.setString(roleKey, role);
  account_info.email = email;
  account_info.password = password;
  account_info.role = role;
  account_info.reLogin = true;
}

destroySession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(emailKey);
  prefs.remove(passwordKey);
  prefs.remove(roleKey);
  account_info.destroyInfo();
  globalTemp.destroyInfo();
}

Future<String> inSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.containsKey(roleKey)){
    return prefs.getString(roleKey);
  }
  return "";
}

loadSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.containsKey(emailKey)) {
    account_info.email = prefs.getString(emailKey);
    account_info.password = prefs.getString(passwordKey);
    account_info.role = prefs.getString(roleKey);
    account_info.reLogin = false;
  }
}