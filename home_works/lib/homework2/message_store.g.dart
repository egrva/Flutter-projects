// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MessageStore on _MessageStore, Store {
  Computed<List<Message>>? _$AnotherMessagesComputed;

  @override
  List<Message> get AnotherMessages => (_$AnotherMessagesComputed ??=
          Computed<List<Message>>(() => super.AnotherMessages,
              name: '_MessageStore.AnotherMessages'))
      .value;
  Computed<List<Message>>? _$MyMessagesComputed;

  @override
  List<Message> get MyMessages =>
      (_$MyMessagesComputed ??= Computed<List<Message>>(() => super.MyMessages,
              name: '_MessageStore.MyMessages'))
          .value;

  final _$messagesAtom = Atom(name: '_MessageStore.messages');

  @override
  ObservableList<Message> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<Message> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  final _$_MessageStoreActionController =
      ActionController(name: '_MessageStore');

  @override
  void fetchNewMessage() {
    final _$actionInfo = _$_MessageStoreActionController.startAction(
        name: '_MessageStore.fetchNewMessage');
    try {
      return super.fetchNewMessage();
    } finally {
      _$_MessageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sendMessage(String text) {
    final _$actionInfo = _$_MessageStoreActionController.startAction(
        name: '_MessageStore.sendMessage');
    try {
      return super.sendMessage(text);
    } finally {
      _$_MessageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages},
AnotherMessages: ${AnotherMessages},
MyMessages: ${MyMessages}
    ''';
  }
}
