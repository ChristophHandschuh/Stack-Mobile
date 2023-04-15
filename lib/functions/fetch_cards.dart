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

Future fetch_cards(String stack_id) async {
  //init Hive and open storage
  await Hive.initFlutter();
  var storage = await Hive.openBox('storage');
  Directory appDocDir = await getApplicationDocumentsDirectory();
  var dio = Dio();
  var cookieJar = PersistCookieJar(ignoreExpires: true, storage: FileStorage(appDocDir.path + "/.cookies/"));
  dio.interceptors.add(CookieManager(cookieJar));
  //try{
    /*const url = 'http://my-json-server.typicode.com/ChristophHandschuh/Stack-Mobile/cards';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);*/
    Response response = await dio.get('https://stack-study.me:3001/cards', queryParameters: {"_id": stack_id});
    final data = response.data;
    //log("Fetch_CARDS: $data");
    for(var i = 0; i<data.length; i++)
    {
      //log(data[i]["_id"]);
      storage.put(data[i]["_id"], data[i]);
    }
  /*}catch(e) {
    log("No internet: json couldn't load");
  }*/
}