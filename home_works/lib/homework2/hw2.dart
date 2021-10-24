import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:home_works/homework2/message_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

const MY_NAME = "Anastasiia";

class Hw2 extends StatefulWidget {
  Hw2({Key? key}) : super(key: key);

  final String title = "Homework 2";

  @override
  _Hw2State createState() => _Hw2State();
}

class _Hw2State extends State<Hw2> {
  MessageStore _messageStore = Modular.get<MessageStore>();

  @override
  void initState() {
    super.initState();
    _messageStore.fetchNewMessage();
    initFirebase();
  }

  Future<void> initFirebase() async {
    await Firebase.initializeApp();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    messaging.getToken().then((token) => print(token));
  }

  TextEditingController _textEditingController = TextEditingController();

  void _addToList(String text) {
    _messageStore.sendMessage(text);
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _messageStore.fetchNewMessage();
              },
              icon: Icon(CupertinoIcons.arrow_counterclockwise))
        ],
        title: new Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Observer(builder: (context) {
                    return ListView(
                        children: _messageStore.messages.map((item) {
                      final randomAvatar = Random().nextInt(6) + 1;
                      return Container(
                        margin: EdgeInsets.only(
                            top: 10.0, bottom: 5.0, right: 20.0, left: 20.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFEFEE),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              // bottomLeft: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                                radius: 35.0,
                                backgroundImage: AssetImage(
                                    "assets/avatars/$randomAvatar.png")),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.author,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(item.message,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black54))
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList());
                  }),
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
