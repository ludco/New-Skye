import 'package:flutter/material.dart';
import './SignDetails.dart' as details;
import './Constants.dart' as Constants;

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.deepPurple[800],
        child: new Center(
            child: new GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                padding: const EdgeInsets.all(2.0),
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                children: Constants.SUNSIGNS.map((sunsign) {
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
