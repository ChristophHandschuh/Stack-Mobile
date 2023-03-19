import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:clipboard/clipboard.dart';
import 'package:overlay_support/overlay_support.dart';

class shopping_list extends StatefulWidget {
  const shopping_list({Key? key}) : super(key: key);

  @override
  _shopping_list createState() => _shopping_list();
}

class _shopping_list extends State<shopping_list> {

  final textController = TextEditingController();
  bool inList = false;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<SettingsProvider>(context, listen: false);
    var buyList = prov.getDicts();
    buyList.sort();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: const Icon(Icons.text_snippet, size: 28,),
        title: TextField(
          controller: textController,
        ),
        actions: [
          Padding(padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
            child: IconButton(
              iconSize: 26.0,
              icon: const Icon(
                Icons.copy,
                color: Colors.white,
              ),
              onPressed: () async {
                  String buyListtext = "1. ${buyList[0]}";
                  for(int i = 1; i < buyList.length; i++){
                    buyListtext = buyListtext + "\n${i+1}. " + buyList[i];
                  }
                  FlutterClipboard.copy(buyListtext);
                }
            ),
          ),
        ],
      ),
      body: buyList.isNotEmpty ? ListView.separated(
        itemCount: buyList.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Text('${index+1}', style: const TextStyle(fontSize: 25),),
            title: Text(buyList[index], style: const TextStyle(fontSize: 25),),
            onLongPress: () {
              setState(() {
                prov.deleteDict(buyList[index]);
              });
            },
            trailing: const Icon(Icons.remove_circle_outline),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(
              color: Colors.lightBlue,
            ),
      )
      : const Center(child: Text('No Groceries')),
      floatingActionButton: SizedBox(
        height: 75.0,
        width: 75.0,
        child: FittedBox(
          child:FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                inList = false;
                for (var i = 0; i < buyList.length; i++) {
                  if(textController.text == buyList[i]){
                    inList = true;
                  }
                }
                if(textController.text != '' && !inList){
                    Provider.of<SettingsProvider>(context, listen: false).addDict(textController.text);
                    //buy_list.add(textController.text);
                }
                  textController.clear();}
              );
            },
          ),
        ),
      ),
    );
  }
}


