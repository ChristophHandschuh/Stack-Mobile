import 'dart:convert';
import 'dart:developer';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

//http download from server and save
Future fetch_stacks() async {
  //init Hive and open storage
  await Hive.initFlutter();
  var storage = await Hive.openBox('storage');
  Directory appDocDir = await getApplicationDocumentsDirectory();
  var dio = Dio();
  var cookieJar = PersistCookieJar(ignoreExpires: true, storage: FileStorage(appDocDir.path + "/.cookies/"));
  dio.interceptors.add(CookieManager(cookieJar));
  try{
    Response response = await dio.get('https://stack-study.me:3001/stacks');
    final data = response.data;
    //log("json: $data");
    storage.put(0, data['results']);
  }catch(e) {
      log("No internet: json couldn't load");
  }
}