import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:demo/home.dart';

class Submit extends StatefulWidget {
  final bool heath;

  Submit({Key key,this.heath}) : super (key: key);
  @override
  _SubmitState createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  static DateTime now = DateTime.now();
  String time = DateFormat('MM-dd-yyyy').format(now);
  Color bgColor = Colors.green;
  String title = 'Congratulations!';
  String response = 'Your assessment has been submited.';

  void checkHealth(){
    if(!widget.heath){// user is not healthy
      bgColor = Colors.red;
      title = 'Your status has been recorded';
      response = 'hope you get well soon.';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkHealth();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(title: new Text(title),
        backgroundColor: bgColor,
        centerTitle: true,
        elevation: 0,),
      body: Center(child: new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(response,
            style: TextStyle(color: Colors.white),),
          ),
          Container(

            height: 200,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 3.0,color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(time),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Name'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Faculty'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Position'),
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(30),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                ButtonTheme(
                  minWidth: 200.0,
                  child: RaisedButton(
                    onPressed:(){
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) => Home()),
                              (route) => route == null);
                    },
                    color: Colors.greenAccent,
                    child: Text('Home', style: TextStyle(color: Colors.white),),
                  ),
                ),
                Text('You can check it anytime in',style: TextStyle(color: Colors.white),),
                Text('My Status on your user account page',style: TextStyle(color: Colors.white),),
              ],
            ),
          )
        ],
      )),
    );
  }
}
