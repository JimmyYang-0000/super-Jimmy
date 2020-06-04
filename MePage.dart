import 'package:flutter/material.dart';

class MePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return new Page();
  }
}

class Page extends State<MePage>{
  Color _backgroundColor = Colors.white;


  @override
  Widget build (BuildContext context){
    return new Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text("My Account",style: TextStyle(color: Colors.green),),
        backgroundColor: _backgroundColor, centerTitle: true,elevation: 0,
      ),

      body: Column(
        children: <Widget>[
          Row(// green divider
            children: <Widget>[
              Expanded(child: Divider(color: Colors.green,thickness: 2,),)
            ],
          ),
          new Padding(padding: EdgeInsets.all(10)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(10)),
              //Online image, replace it if need
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/41/09/65/410965ea-5d16-e220-5db2-7b72d5759ddc/source/256x256bb.jpg'),
                    fit:BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              Container(// Empty container
                width: 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10)),
                    Text('Name',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('ID:xxxxxx'),
                    Row (
                      children: <Widget>[
                        Text('Occupation:'),ButtonBar(children: <Widget>[new Text('select')]),
                      ],
                    )
                  ],
                ),


              ),

            ],
          ),
              Row(// green divider
              children: <Widget>[
              Expanded(child: Divider(color: Colors.green,thickness: 2,),)
              ],
              ),
          Container(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text('My Status'),
                Row(// green divider
                  children: <Widget>[
                    Expanded(child: Divider(color: Colors.green,thickness: 2,),)
                  ],
                ),
              ],
            ),

          )


        ],

      ),
    );
  }
}