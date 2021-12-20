import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/bonus_feature/bonus_feature.dart';

class BonusModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes =>
      [
        ChildRoute('/',
            child: (context, args) =>
                BonusFeature(),
            transition: TransitionType.downToUp),
      ];
}