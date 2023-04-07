import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


//http download from server and save
Future check_login() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  var dio = Dio();
  var cookieJar = PersistCookieJar(ignoreExpires: true, storage: FileStorage(appDocDir.path + "/.cookies/"));
  dio.interceptors.add(CookieManager(cookieJar));
  try{
    //print(await cookieJar.loadForRequest(Uri.parse('http://172.245.156.33:3001/login')));
    Response response = await dio.get('http://172.245.156.33:3001/login');
    final data = response.data;
    return data["loggedIn"];
    //log("CHECK LOGIN: $body");
  }catch(e) {
    log("No internet: json couldn't load");
  }
}