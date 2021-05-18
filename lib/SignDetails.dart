import 'package:flutter/material.dart';

class SignDetails extends StatelessWidget {
  // Declare a field that holds the Item.
  final sunsign;

  // In the constructor, require a Item.
  SignDetails(this.sunsign);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          sunsign,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(sunsign),
      ),
    );
  }
}
