import 'package:flutter/material.dart';
import './YesNo.dart';

class AssessmentPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return new Page();
  }
}

class Page extends State<AssessmentPage>{
  //Color for title and background
  Color _backgroundColor = Colors.green;
  Color _textColor = Colors.white;


  //Tap on plus icon
  void _onTap(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Questionnaire()), (route) => route == null);
  }

  @override
  Widget build (BuildContext context){
    return new Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(
          title: Text("Assessment", style: TextStyle(color: _textColor),),
          backgroundColor: _backgroundColor, centerTitle: true,elevation: 1,
    ),
      body: new Center(// Assessment Page
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
               onPressed: _onTap,
              child:Icon(Icons.add_circle_outline, color: _textColor,size: 60,) ,
              backgroundColor: _backgroundColor,
              elevation: 0,

            ),
            Text("Start self assessment for today",
              style: TextStyle(color: _textColor),),
          ],
        ),
      ),
    );
  }
}