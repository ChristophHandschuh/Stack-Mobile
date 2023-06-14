import 'package:hive/hive.dart';
import 'dart:math';
import 'package:stack_flashcards/functions/update_cards.dart';
final storage = Hive.box('storage');

var NEW_STEPS = [1, 10];

Future<Map<String,dynamic>> learn_Algo(res, cards, stack_id) async {
  var current_card = cards[0];
  if(current_card["status"] == "new"){
    if(res){
      current_card["step_index"] = 1;
    }
    current_card["time"] = DateTime.now().add(Duration(minutes: NEW_STEPS[current_card["step_index"]] + Random().nextInt(2))).millisecondsSinceEpoch;
    current_card["status"] = "learning";
  }else if(current_card["status"] == "learning"){
    if(res){ //card right
      current_card["step_index"] = current_card["step_index"] + 1;
      if(current_card["step_index"] > NEW_STEPS.length) {
        current_card["status"] = "learned";
        current_card["time"] = DateTime.now().add(Duration(minutes: 300)).millisecondsSinceEpoch;
      }else{
        current_card["time"] = DateTime.now().add(Duration(minutes: NEW_STEPS[current_card["step_index"]] + Random().nextInt(2))).millisecondsSinceEpoch;
      }
    }else{ //card wrong
      current_card["status"] = "new";
      current_card["step_index"] = 0;
      current_card["time"] = DateTime.now().add(Duration(minutes: NEW_STEPS[current_card["step_index"]] + Random().nextInt(2))).millisecondsSinceEpoch;
    }
  }else if(current_card["status"] == "learned"){
    if(res){ //card right
        current_card["time"] = DateTime.now().add(Duration(minutes: 2000)).millisecondsSinceEpoch;
      }else{
        current_card["time"] = DateTime.now().add(Duration(minutes: NEW_STEPS[current_card["step_index"]] + Random().nextInt(2))).millisecondsSinceEpoch;
      }
    }else{ //card wrong
      current_card["status"] = "new";
      current_card["step_index"] = 0;
      current_card["time"] = DateTime.now().add(Duration(minutes: NEW_STEPS[current_card["step_index"]] + Random().nextInt(2))).millisecondsSinceEpoch;
    }

  sort_ascending(cards);
  update_cards(stack_id, cards);
  print(cards);

  //check if card.date is, or is more then 1 minute in the future
  if(DateTime.now().add(Duration(minutes: 1)).millisecondsSinceEpoch.toInt() > cards[0]["time"]){
    return await storage.get(cards[0]["card_id"]);
  }else{
    return {};
  }
}

void sort_ascending(cards){
  var i = 0;
  while(cards.length != 1 && i < cards.length-1 && cards[i]["time"] > cards[i+1]["time"]){
    var temp = cards[i];
    cards[i] = cards[i+1];
    cards[i+1] = temp;
    i++;
  }
}