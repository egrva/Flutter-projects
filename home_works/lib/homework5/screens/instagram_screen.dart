import 'package:flutter/material.dart';
import 'package:home_works/homework5/modules/home_feed_page.dart';
import 'package:home_works/homework5/screens/add_new_post_screen.dart';
import 'package:home_works/homework5/stores/posts_store.dart';


class InstagramFeed extends StatefulWidget {
  const InstagramFeed({Key? key}) : super(key: key);

  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {

  @override
  Widget build(BuildContext context) {
    return MainScaffold();
  }
}

class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  final PostsStore postsStore = PostsStore();
  int _tabSelectedIndex = 0;
  late ScrollController _scrollController;

  void _scrollToTop() {
    if (_scrollController == null) {
      return;
    }
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.decelerate,
    );
  }

  void _onTabTapped(BuildContext context, int index) {
    if (index == _tabSelectedIndex) {
      _scrollToTop();
    } else {
      setState(() => _tabSelectedIndex = index);
    }
  }

  Widget _buildPlaceHolderTab(String tabName) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: const <Widget>[
            Text(
              'OOOOoooops!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_tabSelectedIndex) {
      case 0:
        _scrollController =
            ScrollController(initialScrollOffset: 0);
        return HomeFeedPage(scrollController: _scrollController, postsStore: postsStore);
      default:
        const tabIndexToNameMap = {
          0: 'Main',
          1: 'Search',
          2: 'Reels',
          3: 'Activity',
          4: 'Profile',
        };
        return _buildPlaceHolderTab(tabIndexToNameMap[_tabSelectedIndex] ?? 'Error');
    }
  }

  Widget _buildBottomNavigation() {
    const unselectedIcons = <Widget>[
      ImageIcon(AssetImage("assets/instagram/icons/home.png")),
      ImageIcon(AssetImage("assets/instagram/icons/search.png")),
      ImageIcon(AssetImage("assets/instagram/icons/reels.png")),
      ImageIcon(AssetImage("assets/instagram/icons/heart.png")),
      CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage("assets/instagram/avatar.jpg")
      )
    ];
    const selecteedIcons = <Widget>[
      ImageIcon(AssetImage("assets/instagram/icons/home.png"), color: Colors.black),
      ImageIcon(AssetImage("assets/instagram/icons/search.png"), color: Colors.black),
      ImageIcon(AssetImage("assets/instagram/icons/reels.png"), color: Colors.black),
      ImageIcon(AssetImage("assets/instagram/icons/heart.png"), color: Colors.black),
      CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage("assets/instagram/avatar.jpg")
      )
    ];
    final bottomNavigationItems = List.generate(5, (int i) {
      final iconData =
      _tabSelectedIndex == i ? selecteedIcons[i] : unselectedIcons[i];
      return BottomNavigationBarItem(icon: iconData, title: Container());
    }).toList();

    return Builder(builder: (BuildContext context) {
      return BottomNavigationBar(
        iconSize: 32.0,
        type: BottomNavigationBarType.fixed,
        items: bottomNavigationItems,
        currentIndex: _tabSelectedIndex,
        onTap: (int i) => _onTabTapped(context, i),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[50],
        title: Row(
          children: <Widget>[
            SizedBox(width: 10.0),
            GestureDetector(
              child: const Text(
                'Instagram',
                style: TextStyle(
                    fontFamily: 'Billabong',
                    color: Colors.black,
                    fontSize: 40.0),
              ),
              onTap: _scrollToTop,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          GestureDetector(
            child: Container(
                width: 24,
                height: 24,
                child: Image.asset("assets/instagram/icons/add.png")
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddNewPostScreen(postsStore: postsStore))),
          ),
          const SizedBox(width: 32.0),
          GestureDetector(
            child: Container(
                width: 24,
                height: 24,
                child: const ImageIcon(
                    AssetImage("assets/instagram/icons/messenger.png"),
                    size: 24,
                    color: Colors.black
                )
            ),
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(width: 16.0)
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }
}
