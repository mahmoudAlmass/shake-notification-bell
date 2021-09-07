import 'package:flutter/material.dart';
class Bell extends StatefulWidget {

  double rotation;
  VoidCallback func;
  Bell({required this.rotation,required this.func});
  
  @override
  _BellState createState() => _BellState();
}

class _BellState extends State<Bell> {
  @override
  Widget build(BuildContext context) {
    return  Transform.rotate(
        angle: widget.rotation,
            child: new IconButton(
                icon: Icon(Icons.notifications),
                iconSize:28.0,
                onPressed: widget.func,
                ),
      );
  }
}