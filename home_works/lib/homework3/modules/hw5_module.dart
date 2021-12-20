import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/homework4/image_store.dart';
import 'package:home_works/homework5/screens/instagram_screen.dart';
import 'package:home_works/homework5/stores/posts_store.dart';

class Hw5Module extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes =>
      [
        ChildRoute('/',
            child: (context, args) =>
                InstagramFeed(),
            transition: TransitionType.downToUp),
      ];
}