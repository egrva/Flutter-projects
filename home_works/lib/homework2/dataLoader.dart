import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Person {
  var name = "";
  var status = "";
  var id = 0;
}

Future<List<Person>> loadPersons() async{
  var response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
  var json = convert.jsonDecode(response.body);
  List<dynamic> jsonPersons = json["results"];
  List<Person> persons = [];

  for (var p in jsonPersons) {
    var person = Person();
    person.id = p["id"];
    person.name = p["name"];
    person.status = p["status"];
    persons.add(person);
  }

  return persons;
}
