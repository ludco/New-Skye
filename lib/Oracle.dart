import 'package:flutter/material.dart';

class First extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return new Container(
      color: Colors.deepPurple[800],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Text('Posez une question à l\'oracle, puis secouez votre mobile', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color : Colors.white),),
          new Image(image: new AssetImage('images/oracle.png'))
        ],
      )
    );
  }
}