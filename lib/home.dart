import 'package:flutter/material.dart';
import 'package:app_usage/app_usage.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home>{
  var time = 0;
  List<AppUsageInfo> _infos = [];

  @override
  void initState() {
    super.initState();
  }

  void getUsageStats() async {
    var time = 0;
    try {
      print("Getting usage stats...");
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(Duration(minutes: 1));
      List<AppUsageInfo> infoList =
      await AppUsage().getAppUsage(startDate, endDate);
      setState(() => _infos = infoList);
      print(infoList);

      for (var info in infoList) {
        print(info.toString());
        time += info.usage.inMinutes;
      }
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  Text("Home", style: TextStyle(fontSize: 30, fontFamily: "Outfit_Bold")),
                ],
              )
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffc7c7c7)),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("55", style: TextStyle(fontSize: 28, fontFamily: "Outfit_Bold")),
                          Text("studied cards", style: TextStyle(color: Color(0xff909090))),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffc7c7c7)),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$time min", style: TextStyle(fontSize: 28, fontFamily: "Outfit_Bold")),
                          Text("studied today", style: TextStyle(color: Color(0xff909090))),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}