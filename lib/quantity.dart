import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'settings_provider.dart';

class Quantity extends StatefulWidget {
  final String product;
  final String date;
  final String quant;
  final String storage;
  final bool remove;

  const Quantity({Key? key, required this.product, required this.date,
    required this.quant, required this.remove, required this.storage}) : super(key: key);

  @override
  _Quantity createState() => _Quantity();
}

class _Quantity extends State<Quantity> {

  late TextEditingController product = TextEditingController(text: widget.product);
  late TextEditingController date = TextEditingController(text: widget.date);
  late TextEditingController quant = TextEditingController(text: widget.quant);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<SettingsProvider>(context, listen: false);
    var list = prov.getList();

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_sharp,
                color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10, right: 10),
              child: Column(
                  children: <Widget>[
                Padding(
                padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: product,
                    style: const TextStyle(fontSize: 27.0,),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Product',
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, bottom: 10, right: 10),
                  child: TextField(
                    controller: date,
                    style: const TextStyle(fontSize: 30.0,),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:'exp. Date',
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, bottom: 10, right: 10),
                  child: TextField(
                    controller: quant,
                    style: const TextStyle(fontSize: 30.0,),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Quantity',
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, bottom: 10, right: 10),
                  child: Row(
                    children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 10, bottom: 10, right: 10),
                      child: TextButton(
                        child: const Text("2x", style: TextStyle(fontSize: 45, color: Colors.white),),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                        onPressed: () async {
                          quant.text="2";
                            setState(() {});
                          },
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 20, bottom: 10, right: 10),
                      child: TextButton(
                        child: const Text("3x", style: const TextStyle(fontSize: 45, color: Colors.white),),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                        onPressed: () async {
                          quant.text="3";
                          setState(() {});
                          },
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 20, bottom: 10, right: 10),
                      child: TextButton(
                        child: const Text("4x", style: TextStyle(fontSize: 45, color: Colors.white),),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                        onPressed: () async {
                          quant.text="4";
                          setState(() {});
                          },
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 20, bottom: 10, right: 10),
                      child: TextButton(
                        child: const Text("5x", style: TextStyle(fontSize: 45, color: Colors.white),),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                        onPressed: () async {
                          quant.text="5";
                          setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 210, left: 20, bottom: 10),
                  child: Row(
                    children: [
                       CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.lightBlue,
                          child: IconButton(
                            iconSize: 70.0,
                            icon: const Icon(Icons.cancel_outlined, color: Colors.white,),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.lightBlue,
                          child:IconButton(
                            iconSize: 70.0,
                            icon: const Icon(Icons.check, color: Colors.white,),
                            onPressed: () async {

                              bool f = false;
                              if(widget.remove){  //edit product
                                for(var i = 0; i < list.length; i++) {
                                  if(list[i]['products'] == widget.product && list[i]['storage'] == widget.storage && list[i]['dates'] == widget.date){
                                    prov.changeProductAt(i, quant.text, product.text, date.text);
                                  }
                                }
                              }else{  //add quantity
                                for(var i = 0; i < list.length; i++) {
                                  if(list[i]['products'] == product.text && list[i]['storage'] == widget.storage && list[i]['dates'] == date.text){
                                    f = true;
                                    int temp= int.parse(quant.text) + int.parse(list[i]['quantities'].toString());
                                    prov.changeProductAt(i, temp.toString(), product.text, date.text);
                                  }
                                }
                                if(!f){   //new product
                                  prov.addProducts(widget.storage, product.text, date.text, quant.text);
                                }
                              }
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => inStorage(list: prov.getList(), storage: widget.storage)));
                            },

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}