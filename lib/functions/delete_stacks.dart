import 'dart:developer';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

void onDeleteStack(int index,Function refresh_func, ) {
  final storage = Hive.box('storage');
  late var stack = storage.get(0);
  var stack_id = stack[index]["_id"];
  try {
    delete_stack(stack_id);
    stack.remove(stack[index]);
    refresh_func();
  } catch (e) {
    log("Error: $e");
  }
}

Future delete_stack(String stack_id) async {
  //init Hive and open storage
  await Hive.initFlutter();
  var storage = await Hive.openBox('storage');
  Directory appDocDir = await getApplicationDocumentsDirectory();
  var dio = Dio();
  var cookieJar = PersistCookieJar(ignoreExpires: true, storage: FileStorage(appDocDir.path + "/.cookies/"));
  dio.interceptors.add(CookieManager(cookieJar));

  try{
    Response response = await dio.post('https://stack-study.me:3001/deletestack', data: {'_id': stack_id});
    final data = response.data;
  if(data["status"] == true)
  {
    return true;
  }
  else
  {
    log("No internet: json couldn't delete");
    return false;
  }
  }catch(e) {
    log("No internet: json couldn't delete");
  }
}