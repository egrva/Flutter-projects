import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/dataLoader.dart';
import 'package:rick_and_morty_app/personWidget.dart';

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


    // return ListView.builder(itemCount: persons.length,
    //   itemBuilder: (context, index) => Row(
    //     children: [
    //       IconButton(onPressed: () => {} , icon: Icon(Icons.android))
    //     ],
    //   ));
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
