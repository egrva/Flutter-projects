import 'package:flutter/material.dart';
import 'package:my_first_flutter_projects/detail_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _items = ['first'];

  TextEditingController _textEditingController = TextEditingController();

  void _addToList(String text) {
    setState(() {
      _items.add(text);
    });
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: _items.map((item) {
                      return ListTile(
                        title: Text(item,
                            style: const TextStyle(
                                color: Colors.pink, fontSize: 16)),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailInfo(title: item)));
                        },
                      );
                    }).toList(),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                      ),
                    ),
                    GestureDetector(
                      child: Icon(Icons.add),
                      onTap: () {
                        _addToList(_textEditingController.text);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
