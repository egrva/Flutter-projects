import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PersonDetails {
  var name = "";
  var id = 0;
  var avatar = "";
  var locationName = "";
  var locationUrl = "";
  var status = "";
  var created = "";
  var type = "";
  var gender = "";
  var originName = "";
  var originUrl ="";
  List<String> episodes = [];
}

Future<PersonDetails> loadPerson(int id) async{
  var response = await http.get(Uri.parse("https://rickandmortyapi.com/api/character/$id"));

  PersonDetails personDetails;
    var p = convert.jsonDecode(response.body);
    personDetails = PersonDetails();
    personDetails.id = p["id"];
    personDetails.name = p["name"];
    personDetails.avatar = p["image"];
    personDetails.locationName = p["location"]["name"];
    personDetails.locationUrl = p["location"]["url"];
    personDetails.status = p["status"];
    personDetails.created = p["created"];
    personDetails.type = p["type"];
    personDetails.gender = p["gender"];
    personDetails.originName = p["origin"]["name"];
    personDetails.originUrl = p["origin"]["url"];

  return personDetails;
}