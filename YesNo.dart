import 'package:flutter/material.dart';
import './CheckboxList.dart';


//Data package which sends to next page
class Data {
  bool emergency = false;
  bool closeContact = false;
  void setEmergency(){emergency = true;}
  void setCloseContact(){closeContact = true;}
}

class Questionnaire extends StatefulWidget{

  @override
  PageQuestionnaire createState() => new PageQuestionnaire();
}

class PageQuestionnaire extends State<Questionnaire>{
  int _index = 0;
  static TextStyle _size30Bold =  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  //List of questions packaged by container
  List questions = [
    //Question 1
    Container(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Are you currently experiencing any of these issues?',
                style:_size30Bold,
              ),
              Padding(padding: EdgeInsets.all(50),),
              Text('• Severe difficulty breathing',
                style: new TextStyle(fontWeight: FontWeight.bold),),
              Text('  (struggling for each breathn, can only speak in single words)'),
              Padding(padding: EdgeInsets.all(10),),
              Text('• Severe chest pain',
                style: new TextStyle(fontWeight: FontWeight.bold),),
              Text('  (constant tightness or crushing sensation)'),
              Padding(padding: EdgeInsets.all(10),),
              Text('• Feeling confused or unsure of where you are',
                style: new TextStyle(fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.all(10),),
              Text('• Losing consciousness',
                style: new TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    ),
    //Question 2
    Container(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10),),
              Text('In the last 14 days, have you been in close physical contact with someone who test positive for COVID-19?',
                style: _size30Bold,
              ),
              Padding(padding: EdgeInsets.all(40),),
              Text('  Close physical contact means:'),
              Padding(padding: EdgeInsets.all(10),),
              Text('• being less than 2 metres away in the same area for over 15 minutes', style: new TextStyle(fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.all(10),),
              Text('• living in the same home', style: new TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    ),
  ];

  final data = Data();

  //Tap on button no
  //Check whether the question list is finish; if finish, move to next page with data
  void tapNo(){
    setState(() {
      _index == questions.length - 1 ? Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => CheckboxList(yndata:data)),(route) => route == null): _index++;
    });
  }

  //Tap on button yes
  //Set data depending on current index
  //Check whether the question list is finish; if finish, move to next page with data
  void tapYes(){
    setState(() {
      switch(_index){
        case 0:{
          data.setEmergency();
          break;
        }
        case 1:{
          data.setCloseContact();
          break;
        }
        default:{
          //do nothing
          break;
        }
      }
      _index == questions.length - 1 ? Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => CheckboxList(yndata:data)),
              (route) => route == null): _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Questionnaire',),backgroundColor: Colors.green,centerTitle: true,
        ),
        body: new Column(
          children: <Widget>[
            questions[_index],
            Center(
              child: Column(
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 200.0,
                    child: RaisedButton(
                      onPressed: tapNo,
                      color: Colors.green,
                      child: Text('No'),
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(10),),
                  ButtonTheme(
                    minWidth: 200.0,
                    child: RaisedButton(
                      onPressed: tapYes,
                      color: Colors.red,
                      child: Text('Yes'),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20),),
                ],
              ),
            ),
          ],
        )
    );
  }
}