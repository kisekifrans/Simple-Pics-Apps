// Import flutter helper library
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;

import 'models/image_models.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    final response = await get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'),
    );
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

// Must define a 'build' method that returns the widget that 'this' widget will show
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
