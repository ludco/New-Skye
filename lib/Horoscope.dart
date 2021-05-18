import 'package:flutter/material.dart';
import './SignDetails.dart' as details;

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sunSigns = [
      'aries',
      'taurus',
      'gemini',
      'leo',
      'cancer',
      'virgo',
      'libra',
      'scorpio',
      'sagittarius',
      'capricorn',
      'aquarius',
      'pisces',
    ];

    return new Container(
        color: Colors.deepPurple[800],
        child: new Center(
            child: new GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                padding: const EdgeInsets.all(2.0),
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                children: sunSigns.map((sunsign) {
                  return TextButton(
                      child: Image(
                          image: new AssetImage('images/sunsigns/$sunsign.png'),
                          width: 90,
                          height: 90,
                          fit: BoxFit.fill),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return new details.SignDetails(sunsign);
                          }),
                        );
                      });
                }).toList())));
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          child: Text('Pop!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class Sign {
  final String sign;
  Sign(this.sign);
}
