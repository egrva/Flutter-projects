// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostsStore on _PostsStore, Store {
  final _$postsAtom = Atom(name: '_PostsStore.posts');

  @override
  ObservableList<Post> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<Post> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$_PostsStoreActionController = ActionController(name: '_PostsStore');

  @override
  void fetchPosts() {
    final _$actionInfo = _$_PostsStoreActionController.startAction(
        name: '_PostsStore.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_PostsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addPost(String filePath, String description) {
    final _$actionInfo =
        _$_PostsStoreActionController.startAction(name: '_PostsStore.addPost');
    try {
      return super.addPost(filePath, description);
    } finally {
      _$_PostsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posts: ${posts}
    ''';
  }
}
