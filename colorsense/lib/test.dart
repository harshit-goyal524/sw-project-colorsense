import 'package:flutter/material.dart';

class TestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return testRouteState();
  }
}
class testRouteState extends State<TestRoute>{

  var questionIndex=0;

  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title: Text("Here it goes")),
        body: Text("You know!"),


      )
    );
  }
}