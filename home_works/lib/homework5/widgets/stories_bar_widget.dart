import 'package:flutter/cupertino.dart';
import 'package:home_works/homework5/model/models.dart';

import 'avatar_widget.dart';

class StoriesBarWidget extends StatelessWidget {
  final _users = <User>[
    const User(name: "egrv.n", image: "assets/instagram/avatar.jpg"),
    const User(name: "baby_yoda", image: "assets/instagram/baby_yoda.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return AvatarWidget(
            username: _users[i].name,
            userImage: _users[i].image,
            isLarge: true,
            isShowingUsernameLabel: true,
            isCurrentUserStory: i == 0,
          );
        },
        itemCount: _users.length,
      ),
    );
  }
}