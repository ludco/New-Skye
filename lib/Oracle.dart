import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';
import './Constants.dart' as Constants;

class Orcale extends StatefulWidget {
  @override
  _OrcaleState createState() => _OrcaleState();
}

getRandomInt() {
  var random = new Random();
  return random.nextInt(Constants.RESPONSES.length);
}

class _OrcaleState extends State<Orcale> {
  late String response;
  late bool oracle = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      print('ready to shake !');
      var chance = getRandomInt();
      response = Constants.RESPONSES[chance];
      setState(() {
        oracle = true;
      });
    });

    return new Container(
        color: Colors.deepPurple[800],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Text(
              'Posez une question à l\'oracle, puis secouez votre mobile',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            new Image(image: new AssetImage('images/oracle.png')),
            new Text(oracle ? '" $response "' : '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2),
          ],
        ));
  }
}
