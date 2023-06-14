import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

Future update_cards(stack_id, cards) async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  var dio = Dio();
  var cookieJar = PersistCookieJar(ignoreExpires: true, storage: FileStorage(appDocDir.path + "/.cookies/"));
  dio.interceptors.add(CookieManager(cookieJar));

  try{
    Response response = await dio.post('https://stack-study.me:3001/learnstatus', data: {'_id': stack_id,'cards': cards});
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