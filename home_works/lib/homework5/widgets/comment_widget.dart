import 'package:flutter/material.dart';
import 'package:home_works/homework5/utils/text_style_types.dart';

class CommentWidget extends StatefulWidget {
  final String commentText;
  final String username;
  final bool needToShowHeart;

  const CommentWidget(this.commentText, this.username, this.needToShowHeart);

  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {

  Text _buildRichText() {
    var currentTextData = StringBuffer();
    var textSpans = <TextSpan>[
      TextSpan(text: '${widget.username} ', style: bold),
    ];
    widget.commentText.split(' ').forEach((word) {
      if (word.startsWith('#') && word.length > 1) {
        if (currentTextData.isNotEmpty) {
          textSpans.add(TextSpan(text: currentTextData.toString()));
          currentTextData.clear();
        }
        textSpans.add(TextSpan(text: '$word ', style: link));
      } else {
        currentTextData.write('$word ');
      }
    });
    if (currentTextData.isNotEmpty) {
      textSpans.add(TextSpan(text: currentTextData.toString()));
      currentTextData.clear();
    }
    return Text.rich(TextSpan(children: textSpans));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: <Widget>[
          _buildRichText(),
          const Spacer(),
          if (widget.needToShowHeart)
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Flexible(child: ImageIcon(AssetImage("assets/instagram/icons/heart.png"), size: 16, color: Colors.grey)),
            ),
        ],
      ),
    );
  }
}
