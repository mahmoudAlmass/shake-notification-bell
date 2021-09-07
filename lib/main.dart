import 'dart:async';
import 'dart:math';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter=0;
  bool _enabeld=false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 3500), (Timer t) => updateCounter());
    Timer.periodic(Duration(milliseconds: 1), (Timer t) => updateAnimation());

  }

  void updateCounter(){
  setState(() {
    counter++;
    _enabeld=true;
  });
  }
  void updateAnimation(){
    if(_enabeld)
    Future.delayed(Duration(milliseconds: 600),()=>
    setState((){_enabeld=false;}));  
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Shaking notification bill',
      
      home:  Scaffold(
    appBar: AppBar(
        title: Text("Notifications"),
        actions: <Widget>[
          // Using Stack to show Notification Badge
          new Stack(
            children: <Widget>[
              Transform.rotate(
                angle: -20*pi/180,
                    child: ShakeAnimatedWidget(
                              enabled: _enabeld,
                              duration: Duration(milliseconds: 400),
                              shakeAngle: Rotation.deg(z: 20),
                              curve: Curves.linear,
                              child: new IconButton(
                                icon: Icon(Icons.notifications),
                                iconSize:28.0,
                                onPressed: () {
                                  setState(() {
                                      counter = 0;
                                  });
                                }),
                    ),
                    
              ),
              counter != 0 ? new Positioned(
                right: 11,
                top: 9,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    counter < 10 ?
                    '$counter' :'+9',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ) : new Container()
            ],
          ),
        ],
      ),
    

    body: Container(
      margin: EdgeInsets.only(top: 50.0),
      child: Center(
        child: Text('text')
        
      ),
      ),
      ),
      
    );
  }
}
