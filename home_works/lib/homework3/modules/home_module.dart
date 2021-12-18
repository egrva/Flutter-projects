import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/homework3/modules/bonus_module.dart';
import 'package:home_works/homework3/modules/hw1_module.dart';
import 'package:home_works/homework3/modules/hw2_module.dart';
import 'package:home_works/homework3/modules/hw4_module.dart';

import '../home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => MyHomePage(
                  title: 'Homeworks',
                )),
        ModuleRoute('/Bonus', module: BonusModule()),
        ModuleRoute('/Hw1', module: Hw1Module()),
        ModuleRoute('/Hw2', module: Hw2Module()),
        ModuleRoute('/Hw4', module: Hw4Module())
      ];
}
