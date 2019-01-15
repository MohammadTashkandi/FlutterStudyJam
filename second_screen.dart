import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main(){
  runApp(SecondScreen());
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: Text('Hi'),
      ),
    );
  }
}