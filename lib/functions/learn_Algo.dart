import 'package:hive/hive.dart';

final storage = Hive.box('storage');

Future<Map<String,dynamic>> learn_Algo(res, cards) async {
  if(res == true){
    //when res is true, it means the user got the question right
    //the cards[0].time should be updated to 5 minutes in the future and sorted in the array with ascending time
    cards[0]["time"] = DateTime.now().add(Duration(minutes: 5)).millisecondsSinceEpoch;
  }else if(res == false){
    //when res is false, it means the user got the question wrong
    //the cards[0].time should be updated to 1 minute in the future and sorted in the array with ascending time
    cards[0]["time"] = DateTime.now().add(Duration(minutes: 1)).millisecondsSinceEpoch;
  }

  //sort cards with time descending
  //print(cards);
  var i = 0;
  while(cards.length != 1 && i < cards.length-1 && cards[i]["time"] > cards[i+1]["time"]){
      var temp = cards[i];
      cards[i] = cards[i+1];
      cards[i+1] = temp;
      i++;
  }
  //print(cards);

  //check if card.date is, or is more then 1 minute in the future
  if(DateTime.now().add(Duration(minutes: 1)).millisecondsSinceEpoch.toInt() > cards[0]["time"]){
    return await storage.get(cards[0]["card_id"]);
  }else{
    return {};
  }
}