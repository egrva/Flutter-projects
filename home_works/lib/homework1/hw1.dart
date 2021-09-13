import 'package:flutter/material.dart';
import 'package:home_works/homework1/detail_info.dart';

class Hw1 extends StatefulWidget {
  Hw1({Key? key}) : super(key: key);

  final String title = "Home work 1";

  @override
  _Hw1State createState() => _Hw1State();
}

class _Hw1State extends State<Hw1> {
  List<String> _items = [];

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
