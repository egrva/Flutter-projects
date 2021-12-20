import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:home_works/homework5/stores/posts_store.dart';
import 'package:home_works/homework5/widgets/post_widget.dart';
import 'package:home_works/homework5/widgets/stories_bar_widget.dart';


class HomeFeedPage extends StatefulWidget {
  final ScrollController scrollController;
  final PostsStore postsStore;

  const HomeFeedPage({required this.scrollController, required this.postsStore});

  @override
  _HomeFeedPageState createState() => _HomeFeedPageState();
}

class _HomeFeedPageState extends State<HomeFeedPage> {

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) =>
          ListView.builder(
            itemBuilder: (ctx, i) {
              if (i == 0) {
                return StoriesBarWidget();
              }
              return PostWidget(widget.postsStore.posts[i - 1]);
            },
            itemCount: widget.postsStore.posts.length + 1,
            controller: widget.scrollController,
          ),
    );
  }
}


