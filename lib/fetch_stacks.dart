import 'dart:convert';
import 'dart:developer';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

//http download from server and save
Future fetch_stacks() async {
  //init Hive and open storage
  await Hive.initFlutter();
  var storage = await Hive.openBox('storage');
  try{
    const url = 'http://my-json-server.typicode.com/ChristophHandschuh/Stack-Mobile/stacks';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);
    log("json: $body");
    storage.put(0, body['results']);
  }catch(e) {
      log("No internet: json couldn't load");
  }
}