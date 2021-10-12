import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, String> homeworks = {
    "Bonus feature": '/Bonus',
    "Homework #1": '/Hw1',
    "Homework #2": '/Hw2'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: new Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 500.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                child: ListView.builder(
                    itemCount: homeworks.keys.length,
                    itemBuilder: (BuildContext context, int index) {
                      final homeWork = homeworks.keys.elementAt(index);
                      return GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed(homeworks[homeWork]!);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 10.0, bottom: 5.0, right: 20.0, left: 20.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFEFEE),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0)),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                  radius: 35.0,
                                  backgroundImage: AssetImage(
                                      "assets/homeworks/$index.png")),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                homeWork,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}