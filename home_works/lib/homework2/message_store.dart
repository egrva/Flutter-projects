import 'package:dio/dio.dart';
import 'package:home_works/homework2/api_client.dart';
import 'package:home_works/homework2/hw2.dart';
import 'package:home_works/homework2/message.dart';
import 'package:mobx/mobx.dart';

part 'message_store.g.dart';

class MessageStore = _MessageStore with _$MessageStore;

abstract class _MessageStore with Store {
  String url = 'https://itis-chat-app-ex.herokuapp.com/chat';

  @observable
  ObservableList<Message> messages = ObservableList.of([]);

  @action
  void fetchNewMessage() {
    RestClient restClient = RestClient(Dio());
    restClient.getMessages().then((List<Message> messages) {
      this.messages.clear();
      this.messages.addAll(messages);
    }).catchError((error) {
      print(error.toString());
    });
  }

  @computed
  List<Message> get AnotherMessages =>
      messages.where((message) => message.author != MY_NAME).toList();

  @computed
  List<Message> get MyMessages =>
      messages.where((message) => message.author == MY_NAME).toList();

  @action
  void sendMessage(String text) {
    RestClient restClient = RestClient(Dio());
    try {
      restClient.sendMessage(Message(author: MY_NAME, message: text));
    } catch(error) {
      print(error.toString());
    }
  }
}
