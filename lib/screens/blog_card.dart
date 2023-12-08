import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/blog.dart';
import '../providers/blog_provider.dart';
import '../repositories/blog_repository.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.blog,
  });

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    var blogProvider = Provider.of<BlogProvider>(context);
    BlogRepository blogRepository = BlogRepository.instance;

    return Card(
      child: ListTile(
          subtitle: Text(blog.content),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () {
                    blogRepository.toggleLikeInfo(blog.id);
                    blogProvider.refresh();
                  },
                  child: Icon(blog.isLikedByMe
                      ? Icons.favorite
                      : Icons.favorite_outline)),
              ElevatedButton(
                onPressed: () {
                  blogProvider.deleteBlogPost(blog);
                },
                child: const Icon(Icons.delete),
              ),
            ],
          )),
    );
  }
}
