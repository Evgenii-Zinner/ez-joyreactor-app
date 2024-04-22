import '../core.dart';

class CommentsProvider extends MutationsProvider {
  final List<Comment> _comments = [];
  final bool isLoading = false;

  List<Comment> get comments => _comments;

  void fetchComments(String postId) {
    //TODO fetch comments
    notifyListeners();
  }
}
