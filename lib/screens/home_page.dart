import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? mainText = null;
  String? author = null;
  String mainAuth = 'author';
  String firstText = 'Get Awesome Quotes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              mainText ?? firstText,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Text('- ${author ?? mainAuth}')),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = Uri.parse(
                  'https://goquotes-api.herokuapp.com/api/v1/random?count=1');
              var response = await http.get(url);
              //    print('Response status: ${response.statusCode}');
              //  print('Response body: ${response.body}');
              var data = jsonDecode(response.body);
              //print(data["message"]);
              //  print(await http.read(Uri.parse('https://example.com/foobar.txt')));
              mainText = data["quotes"][0]["text"];
              author = data["quotes"][0]["author"];
              setState(() {
                //
              });
            },
            child: const Text('GET QUOTE'),
          ),
        ],
      ),
    );
  }
}
