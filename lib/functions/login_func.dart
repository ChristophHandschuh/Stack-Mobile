import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

Future login_func(String username , password) async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  var dio = Dio();
  var cookieJar = PersistCookieJar(ignoreExpires: true, storage: FileStorage(appDocDir.path + "/.cookies/"));
  dio.interceptors.add(CookieManager(cookieJar));
  try{
    //final response = await http.post(Uri.parse(url), headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'}, body: jsonEncode(<String, String>{'username' : username, 'password' : password}));
    Response response = await dio.post('http://172.245.156.33:3001/login', data: {'username': username, 'password': password});
    return response.data;
  }catch(e){
    print("Error in login_func: " + e.toString());
    return null;
  }
}