import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  String num = ""; String buttonText = "";
  List<DropdownMenuItem<String>> _dropDownMenuItems = [];
  List<String> _buttonList = ["더하기","뺴기","곱하기","나누기"];
  void getDropdownList(){
    for(final item in _buttonList){
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item,style: TextStyle(color: Colors.black),),));
    }
    buttonText = _dropDownMenuItems[0].value.toString();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDropdownList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "결과값 : ${num}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 15),
              child: TextField(
                controller: textEditingController,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 15),
              child: TextField(
                controller: textEditingController2,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      double x = double.parse(textEditingController.text);
                      double y = double.parse(textEditingController2.text);
                      double? result;
                      if(buttonText == "더하기"){
                        result = x + y;
                      }else if(buttonText == "뺴기"){
                        result = x - y;
                      }else if(buttonText == "곱하기"){
                        result = x * y;
                      }else{
                        result = x / y;
                      }
                      num = result.toString();
                    });
                  },
                  child: Row(
                    children: [Icon(Icons.add), Text(buttonText)],
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(15),
              child:DropdownButton(items: _dropDownMenuItems, onChanged: (value){
                setState((){
                buttonText = value.toString();
                });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
