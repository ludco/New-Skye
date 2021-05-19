import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignDetails extends StatefulWidget {
  // Declare a field that holds the Item.
  final String sunsign;

  // In the constructor, require a Item.
  SignDetails(this.sunsign);

  @override
  _SignDetailsState createState() => new _SignDetailsState();
}

// Fetch Horoscope datas
Future<Astro> fetchAstro(sunsign) async {
  final response = await http.get(
      Uri.parse("http://horoscope-api.herokuapp.com/horoscope/today/$sunsign"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Astro.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Horoscope');
  }
}

class _SignDetailsState extends State<SignDetails> {
  late Future<Astro> futureAstro;

  @override
  void initState() {
    super.initState();
    futureAstro = fetchAstro(
      widget.sunsign,
    );
  }

  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.sunsign,
          ),
        ),
        body: Container(
          color: Colors.deepPurple[800],
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            FutureBuilder<Astro>(
              future: futureAstro,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(children: [
                    Image(
                        image: new AssetImage(
                            'images/sunsigns/${widget.sunsign}.png'),
                        width: 90,
                        height: 90,
                        fit: BoxFit.fill),
                    Container(
                        padding: const EdgeInsets.all(40.0),
                        child: Text(snapshot.data!.date,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                    Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(snapshot.data!.horoscope,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2))
                  ]);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return TransparentProgress();
              },
            ),
          ]),
        ));
  }
}

// Astro class representing json data from Horoscop API
class Astro {
  final String horoscope;
  final String date;

  Astro({
    required this.horoscope,
    required this.date,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      horoscope: json['horoscope'],
      date: json['date'],
    );
  }
}

// Circular Progress Indicator with transparent background
class TransparentProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
