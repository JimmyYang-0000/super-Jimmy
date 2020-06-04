import 'package:flutter/material.dart';
class mailPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return new Page();
  }
}

class Page extends State<mailPage>{
  Color _backgroundColor = Colors.white;


  @override
  Widget build (BuildContext context){
    return new Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text("Mail",style: TextStyle(color: Colors.green),),
        backgroundColor: _backgroundColor, centerTitle: true,elevation: 1,
      ),

    );
  }
}