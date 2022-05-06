// Import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/image_models.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response = await (Uri.parse(
        'https://jsonplaceholder.typicode.com/photos/$counter'));
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

// Must define a 'build' method that returns the widget that 'this' widget will show
  Widget build(context) {
    MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.switch_access_shortcut_add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text('Lets see some bitches!'),
        ),
      ),
    );
  }
}
