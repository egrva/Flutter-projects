import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/homework4/hw4.dart';
import 'package:home_works/homework4/image_store.dart';

class Hw4Module extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => ImageStore())];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => Hw4())];
}
