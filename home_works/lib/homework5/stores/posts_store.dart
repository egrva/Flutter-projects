import 'package:hive/hive.dart';
import 'package:home_works/homework5/model/models.dart';
import 'package:mobx/mobx.dart';

part 'posts_store.g.dart';

class PostsStore = _PostsStore with _$PostsStore;

abstract class _PostsStore with Store {

  final my_user = const User(name: "egrv.n", image: "assets/instagram/avatar.jpg");
  final baby_yoda = const User(name: "baby_yoda", image: "assets/instagram/baby_yoda.png");

  late Box box;

  _PostsStore() {
    initiallizeHive();
    fetchPosts();
  }

  initiallizeHive() async {
    box = Hive.box<PostContainer>('postss');
  }

  @observable
  ObservableList<Post> posts = ObservableList.of([]);

  @action
  void fetchPosts() {
    PostContainer? container = box.get('postss', defaultValue: null);
    if (container != null) {
      posts = ObservableList.of(container.posts);
    } else {
      final postsList = <Post>[
        Post(
          user: my_user,
          images: [],
          assetImages: ["assets/instagram/img.png", "assets/instagram/img.png"],
          location: "Tatuin",
          likes: [baby_yoda],
          comments: [
            Comment(text: "I like star wars!", user: my_user),
            Comment(text: "Daddy....😍😍😍!", user: baby_yoda)
          ],
          dateCreated: "25 May 1977",
        ),
      ];
      PostContainer postContainer = PostContainer(posts: postsList);
      box.put('postss', postContainer);
      fetchPosts();
    }
  }

  @action addPost(String filePath, String description) {
    Post newPost = Post(
        user: my_user,
        images: [filePath],
        assetImages: [],
        location: "Unknown",
        likes: [],
        comments: description == "" ? [] : [Comment(text: description, user: my_user)],
    dateCreated: "this year",
    );
    posts.insert(0, newPost);
    PostContainer postContainer = PostContainer(posts: posts);
    box.put('postss', postContainer);
    }
}