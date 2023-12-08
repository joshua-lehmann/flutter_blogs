import 'package:flutter/foundation.dart';

import '../models/blog.dart';
import '../repositories/blog_repository.dart';

class BlogProvider with ChangeNotifier {
  BlogRepository blogRepository = BlogRepository.instance;
  List<Blog> _blogs = [];

  BlogProvider() {
    _initializeBlogs();
  }

  void _initializeBlogs() async {
    _blogs = await blogRepository.getBlogPosts();
    notifyListeners();
  }

  void refresh() async {
    _blogs = await blogRepository.getBlogPosts();
    notifyListeners();
  }

  deleteBlogPost(Blog blog) async {
    await blogRepository.deleteBlogPost(blog);
    refresh();
  }

  // Returns number of liked blogs
  int get likedBlogsCount => _blogs.where((blog) => blog.isLikedByMe).length;

  List<Blog> get blogs => _blogs;
}
