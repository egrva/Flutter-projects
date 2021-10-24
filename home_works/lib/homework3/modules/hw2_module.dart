import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/homework2/hw2.dart';
import 'package:home_works/homework2/message_store.dart';

class Hw2Module extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => MessageStore())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => Hw2(),
            transition: TransitionType.downToUp),
      ];
}
