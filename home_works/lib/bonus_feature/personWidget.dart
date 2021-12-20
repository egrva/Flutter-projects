import 'package:flutter/material.dart';
import 'package:home_works/bonus_feature/personLoader.dart';

class PersonDetailsPage extends StatefulWidget {
  const PersonDetailsPage({Key? key, required this.id}) : super();

  final int id;

  @override
  _PersonDetailsPageState createState() => _PersonDetailsPageState(id: id);
}

class _PersonDetailsPageState extends State<PersonDetailsPage> {
  _PersonDetailsPageState({required this.id}) : super();

  int id;
  PersonDetails? person;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var personInfo = await loadPerson(id);
    setState(() {
      person = personInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    var widget;
    final person = this.person;
    if (person == null)
      widget = Center(
        child: Text("Please wait..."),
      );
    else
      widget = SafeArea(
        child: Column(
          children: [
            GestureDetector(
              child: Image.network(
                person.avatar,
                width: double.infinity,
              ),
              onTap: () => {},
              // showLocationDetails(context, person.locationName, person.locationUrl),
            ),
            Text(person.name)
            
          ],
        ),
      );
    return Scaffold(
      appBar: AppBar(
        title: Text("Person details"),
      ),
      body: widget,
    );
  }
}
