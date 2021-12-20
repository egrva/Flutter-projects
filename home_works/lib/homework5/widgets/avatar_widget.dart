import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String username;
  final String userImage;
  final EdgeInsetsGeometry padding;
  final bool isLarge;
  final bool isShowingUsernameLabel;
  final bool isCurrentUserStory;

  const AvatarWidget({
    required this.username,
    required this.userImage,
    this.padding = const EdgeInsets.all(8.0),
    this.isLarge = false,
    this.isShowingUsernameLabel = false,
    this.isCurrentUserStory = false
  });

  static const _whiteBorderDecoration = BoxDecoration(
    shape: BoxShape.circle,
    border: Border.fromBorderSide(BorderSide(color: Color(0xFFFEF9EB), width: 3.0)),
  );

  static const _greyBoxShadowDecoration = BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(color: Colors.grey, blurRadius: 1.0, spreadRadius: 1.0)
    ],
  );

  @override
  Widget build(BuildContext context) {
    final radius = isLarge ? 28.0 : 14.0;
    final avatar = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: radius * 2 + 9.0,
          width: radius * 2 + 9.0,
          decoration: null,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: _whiteBorderDecoration,
                child: Container(
                  decoration: _greyBoxShadowDecoration,
                  child: CircleAvatar(
                    radius: radius,
                    backgroundImage: AssetImage(userImage),
                  ),
                ),
              ),
              if (isCurrentUserStory)
                Positioned(
                  right: 2.0,
                  bottom: 2.0,
                  child: Container(
                    width: 18.0,
                    height: 18.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      border: Border.all(color: Color(0xFFFEF9EB)),
                    ),
                    child: const Icon(Icons.add, size: 16.0, color: Color(0xFFFEF9EB)),
                  ),
                ),
            ],
          ),
        ),
        if (isShowingUsernameLabel)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              isCurrentUserStory ? 'Your story' : username,
              textScaleFactor: 0.8,
            ),
          ),
      ],
    );

    return Padding(
      padding: padding,
      child: avatar,
    );
  }
}