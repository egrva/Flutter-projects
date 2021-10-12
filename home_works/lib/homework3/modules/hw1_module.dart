import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/homework1/hw1.dart';

class Hw1Module extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => Hw1(),
            transition: TransitionType.downToUp),
      ];
}
