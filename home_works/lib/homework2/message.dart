import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

List<Message> messageFromMap(String str) =>
    List<Message>.from(json.decode(str).map((x) => Message.fromJson(x)));

String messageToMap(List<Message> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Message {
  Message({
    this.id,
    required this.author,
    required this.message,
  });

  String? id;
  String author;
  String message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
