import 'package:flutter/material.dart';
import 'package:home_works/homework2/dataLoader.dart';
import 'package:home_works/homework2/personWidget.dart';

class Hw2 extends StatefulWidget {
  Hw2({Key? key}) : super(key: key);
  final String title = "Home work #2";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Hw2> {
  List<Person>? _characters;
  Exception? _exception;

  void loadData() async {
    try {
      var characters = await loadPersons();
      setState(() {
        this._characters = characters;
      });
    } on Exception catch (e) {
      setState(() {
        _exception = e;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {

    Widget content;
    final List<Person>? currentPersons = _characters;
    final Exception? ex = _exception;
    if (currentPersons != null) {
      content = personsList(context, currentPersons);
    } else if (ex != null) {
      content = exStub(context, ex);
    } else {
      content = loader(context);
    }

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
                  child: content,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget personsList(BuildContext context, List<Person> persons) {
    return ListView(
      children: persons.map((person) {
        return ListTile(
          title: Text(person.name,
              style: const TextStyle(color: Colors.amberAccent, fontSize: 16)),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PersonDetailsPage(id: person.id)));
          },
        );
      }).toList(),
    );
  }

  Widget loader(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Load data...',
          style: Theme.of(context).textTheme.headline4,
        )
      ],
    );
  }

  Widget exStub(BuildContext context, Exception exception) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Oooops... error is ${exception.toString()}',
          style: Theme.of(context).textTheme.headline4,
        )
      ],
    );
  }
}
