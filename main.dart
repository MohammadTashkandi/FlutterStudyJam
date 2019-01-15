import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'second_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      home: Scaffold(
        body: RandomWords(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return new Scaffold (                   // Add from here...
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
      
        itemBuilder: (BuildContext _context, int i) {
          // Add a one-pixel-high divider widget before each row
          // in the ListView.
          if (i.isOdd) {
            return new Divider();
          }

          // The syntax "i ~/ 2" divides i by 2 and returns an
          // integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings
          // in the ListView,minus the divider widgets.
          final int index = i ~/ 2;
          // If you've reached the end of the available word
          // pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the
            // suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.red,
        child: Text(pair.toString().toUpperCase().substring(0,1)),
      ),
      trailing: Icon(Icons.favorite),
      subtitle: Text('My sub'),
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      onTap: (){
        print(Text('hi'));
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => SecondScreen())
        );
      },
    );
  }
}

