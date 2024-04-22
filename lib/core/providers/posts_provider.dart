import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../core.dart';

class PostsProvider extends MutationsProvider {
  final List<Post> _posts = [];
  final LinkedHashSet<String> _postIds = LinkedHashSet();
  bool _isLoading = false;
  int _fetchedPosts = 0;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;

  Future<void> fetchMorePostIds() async {
    debugPrint('fetch post ids called');
    debugPrint('trying to fetch post ids');
    try {
      _isLoading = true;
      notifyListeners();
      debugPrint(postPagerRequest('GOOD', _postIds.length));
      Response response = await api.sendRequest(postPagerRequest('GOOD', 0));

      debugPrint(response.data.toString());

      List<dynamic> postsList =
          response.data['data']['tag']['postPager']['posts'];

      for (var post in postsList) {
        _postIds.add(post['id']);
      }
    } catch (error) {
      debugPrint('Error fetching post IDs: $error');
    } finally {
      debugPrint('fetch post ids finished');
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMorePosts(int count) async {
    debugPrint('fetch posts called');
    if (!_isLoading) {
      debugPrint('trying to fetch posts');
      try {
        for (int i = 0; i < count; i++) {
          _isLoading = true;
          debugPrint('trying to fetch post #$_fetchedPosts');
          if (_posts.length >= _postIds.length) {
            await fetchMorePostIds();
            debugPrint('new ids fetched successfully');
          }
          debugPrint('loading ${_postIds.toList()[_fetchedPosts].toString()}');
          Response response = await api.sendRequest(
            postRequest(_postIds.toList()[_fetchedPosts]),
          );
          debugPrint('response gotten for ${response.data['data']['node']['id']}');
          _posts.add(Post.fromMap(response.data));
          debugPrint('${_posts[_fetchedPosts].postId} added to list');
          _fetchedPosts++;
        }
      } catch (error) {
        debugPrint('Error fetching posts: $error');
      } finally {
        debugPrint('fetch post info finished');
        _isLoading = false;
        notifyListeners();
      }
    }
  }
}
// class PostsProvider extends MutationsProvider {
//   final List<Post> _posts = [];
//   final LinkedHashSet<String> _postIds = LinkedHashSet();
//   bool _isLoading = false;
//   int _fetchedPosts = -1; // initialize _fetchedPosts to -1
//
//   List<Post> get posts => _posts;
//   bool get isLoading => _isLoading;
//
//   Future<void> fetchMorePostIds() async {
//     debugPrint('fetchMorePostIds called');
//     try {
//       _isLoading = true;
//       notifyListeners();
//       debugPrint('sending postPagerRequest with length ${_postIds.length}');
//       Response response = await api.sendRequest(postPagerRequest('GOOD', _postIds.length));
//       debugPrint('postPagerRequest response received');
//       List<dynamic> postsList = response.data['data']['tag']['postPager']['posts'];
//       for (var post in postsList) {
//         _postIds.add(post['id']);
//       }
//     } catch (error) {
//       debugPrint('Error fetching post IDs: $error');
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//       debugPrint('fetchMorePostIds finished');
//     }
//   }
//
//   Future<void> fetchMorePosts(int count) async {
//     debugPrint('fetchMorePosts called with count $count');
//     if (!_isLoading) {
//       try {
//         for (int i = _postIds.length; i > _fetchedPosts; i--) {
//           _isLoading = true;
//           debugPrint('trying to fetch post #${_fetchedPosts + 1}');
//           if (_posts.length >= _postIds.length) {
//             await fetchMorePostIds();
//             debugPrint('new ids fetched successfully');
//           }
//           debugPrint('loading ${_postIds.toList()[i].toString()}');
//           Response response = await api.sendRequest(
//             postRequest(_postIds.toList()[i]),
//           );
//           debugPrint('response gotten for ${response.data['data']['node']['id']}');
//           _posts.add(Post.fromMap(response.data));
//           debugPrint('${_posts[_fetchedPosts + 1].postId} added to list');
//           _fetchedPosts++;
//         }
//       } catch (error) {
//         debugPrint('Error fetching posts: $error');
//       } finally {
//         _isLoading = false;
//         notifyListeners();
//         debugPrint('fetchMorePosts finished');
//       }
//     }
//   }
// }