import 'package:flutter/material.dart';

class Second extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    var sunSigns = [
    'images/sunsigns/aquarius.png',
    'images/sunsigns/aries.png',
    'images/sunsigns/cancer.png',
    'images/sunsigns/capricorn.png',
    'images/sunsigns/gemini.png',
    'images/sunsigns/leo.png',
    'images/sunsigns/libra.png',
    'images/sunsigns/pisces.png',
    'images/sunsigns/sagittarius.png',
    'images/sunsigns/scorpio.png',
    'images/sunsigns/taurus.png',
    'images/sunsigns/virgo.png'
    ];

    return new Container(
      color: Colors.deepPurple[800],
      padding: const EdgeInsets.only(top:50),
      child: new Center(
        child: new GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(2.0),
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        children: sunSigns.map((item) {
          return Container(
            child: Column(
              children: <Widget>[
               new Image(image: new AssetImage(item),width: 90, height: 90, fit:BoxFit.fill  )
              ],
            ),
          );
        }).toList())
      )
    );
  }
}