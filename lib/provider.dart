import 'package:flutter/material.dart';
import 'storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiver/iterables.dart';

class SettingsProvider extends ChangeNotifier {
  static List<String> dictUrls=[];
  static List<String> savedStorage=[];
  static List<Map<String, String>> saved = [];

  void deleteDict(String dict) async {
    dictUrls.remove(dict);
    StorageManager.saveData("dictUrls", dictUrls);
    notifyListeners();
  }


  void addDict(String url) {
    dictUrls.insert(0,url.toString().trim());
    StorageManager.saveData("dictUrls", dictUrls);
    notifyListeners();
  }

  List<String> getDicts() {
    return dictUrls;
  }

  String getDictAt(int i) {
    return dictUrls[i];
  }

  void deleteSto(String dict) async {
    savedStorage.remove(dict);
    StorageManager.saveData("savedStorage", savedStorage);
    notifyListeners();
  }

  void addSto(String url) {
    savedStorage.insert(0,url.toString().trim());
    StorageManager.saveData("savedStorage", savedStorage);
    notifyListeners();
  }

  List<String> getSto() {
    return savedStorage;
  }

  List<Map<String, String>> getList() {
    return saved;
  }

  void changeProductAt(int i, String quant, String prod, String date) {
    try {
      saved[i]['quantities'] = quant;
      saved[i]['dates'] = date;
      saved[i]['products'] = prod;
      //print(saved.length);
      StorageManager.saveData('savedLength', saved.length);
      for (int z = 0; z < saved.length; z++) {
        StorageManager.saveData(
            'savedValues$z', saved
            .elementAt(z)
            .values
            .toList());
        StorageManager.saveData(
            'savedKeys$z', saved
            .elementAt(z)
            .keys
            .toList());
      }
      notifyListeners();
    } catch (e) {
      print(e);
      print("at change");
    }
  }

  void deleteProductAt(int i) {
    try {
      saved.removeAt(i);
      //print(saved.length);
      StorageManager.saveData('savedLength', saved.length);
      for (int z = 0; z < saved.length; z++) {
        StorageManager.saveData(
            'savedValues$z', saved
            .elementAt(z)
            .values
            .toList());
        StorageManager.saveData(
            'savedKeys$z', saved
            .elementAt(z)
            .keys
            .toList());
      }
      notifyListeners();
    } catch (e) {
      print(e);
      print("at delete");
    }
  }

  void addProducts(String stor, String prod, String date, String quant) async {
    try {
      saved.insert(0, {
        "storage": stor,
        "products": prod,
        "dates": date,
        "quantities": quant,
      });
      //print(saved.length);
      StorageManager.saveData('savedLength', saved.length);
      for (int z = 0; z < saved.length; z++) {
        StorageManager.saveData(
            'savedValues$z', saved
            .elementAt(z)
            .values
            .toList());
        StorageManager.saveData(
            'savedKeys$z', saved
            .elementAt(z)
            .keys
            .toList());
      }
    } catch (e) {
      print(e);
      print("at save");
    }
  }



  static void readX() async {
    StorageManager.readData('dictUrls').then((value) {
      if (value != null) dictUrls = List.of(value.cast<String>());
    });
  }

  static void readY() async {
    StorageManager.readData('savedStorage').then((value) {
      if (value != null) savedStorage = List.of(value.cast<String>());
    });
  }

  static void loadStoredProducts() async {
    try {
      int la = await StorageManager.readData('savedLength');
      if (la != null) {
        List<dynamic> key;
        List<dynamic> val;
        Map<String, String> lStr= Map<String, String>();
        for (int z = 0; z < la; z++) {
          key = await StorageManager.readData('savedKeys$z');
          val = await StorageManager.readData('savedValues$z');
          if (key != null && val != null) {
            lStr = Map<String, String>();
            for (var site in zip([key, val])) {
              lStr[site[0]] = site[1];
            }
          }
          if (lStr["storage"] != null) saved.add(lStr);
        }}
    } catch (e) {
      print(e);
      print("at stored");
    }
  }
}
