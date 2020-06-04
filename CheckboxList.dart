import 'package:demo/YesNo.dart';
import 'package:flutter/material.dart';
import 'package:demo/Summary.dart';

//Data package from this page
class CheckboxData {
  bool eme = false;
  bool close = false;
  List symptoms = [false,false,false,false];

  CheckboxData({this.eme, this.close, this.symptoms});
}

class CheckboxList extends StatefulWidget{
  //Data from last page(YesNo.dart)
  final Data yndata;
  CheckboxList({Key key,this.yndata}) : super (key: key);

  @override
  CheckboxListPage createState() => new CheckboxListPage();
}

class CheckboxListPage extends State<CheckboxList>{
  static TextStyle _bold = new TextStyle(fontWeight: FontWeight.bold);
  final CheckboxData checkboxData = CheckboxData();
  var checkList =[false,false,false,false];
  var symptomsList = [
    Text('Fever', style: _bold),
    Text('Chill', style: _bold),
    Text('Sore throat', style: _bold),
    Text('None of above', style: _bold),
  ];

  //tap on submit button
  void submit(){
    setState(() {
      //If the checkboxes are empty, click on last box instead
      bool isEmpty = true;
      for (var s in checkList){
        if (s) isEmpty = false;
      }
      if (isEmpty) checkList[3] = true;

      //Packaging data and move to next page with data
      checkboxData.symptoms = checkList;
      checkboxData.close = widget.yndata.closeContact;
      checkboxData.eme = widget.yndata.emergency;
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Summary(checkboxData:checkboxData)),
              (route) => route == null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Questionnaire',),backgroundColor: Colors.green,centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10),),
                  Text('Are you currently experiencing any of these symptoms? Choose any/all that apply.',
                    style:_bold,),
                  //Fever
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.grey,
                        value: checkList[0],
                        onChanged: (bool newValue) {
                          setState(() {
                            if(newValue==true){checkList[3]=false;}
                            checkList[0] = newValue;
                          });
                        },
                      ),
                      Padding(padding: EdgeInsets.all(5),),
                      symptomsList[0],
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(10),),
                  //Chill
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.grey,
                        value: checkList[1],
                        onChanged: (bool newValue) {
                          setState(() {
                            if(newValue==true){checkList[3]=false;}
                            checkList[1] = newValue;
                          });
                        },
                      ),
                      Padding(padding: EdgeInsets.all(5),),
                      symptomsList[1],
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(10),),
                  //Sore throat
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.grey,
                        value: checkList[2],
                        onChanged: (bool newValue) {
                          setState(() {
                            if(newValue==true){checkList[3]=false;}
                            checkList[2] = newValue;
                          });
                        },
                      ),
                      Padding(padding: EdgeInsets.all(5),),
                      symptomsList[2],
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(10),),
                  //None of above
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.grey,
                        value: checkList[3],
                        onChanged: (bool newValue) {
                          setState(() {
                            if(newValue == true) checkList.fillRange(0, 3, false);
                            checkList[3] = newValue;
                          });
                        },
                      ),
                      Padding(padding: EdgeInsets.all(5),),
                      symptomsList[3],
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(10),),
                  Center(
                    child: ButtonTheme(
                      child: RaisedButton(
                        child: Text('Submit'),
                        color: Colors.green,
                        onPressed: submit,
                    ),
                      minWidth: 200.0,
                    ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}