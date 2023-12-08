import 'package:flutter/material.dart';
import 'package:flutter_blogs_test/repositorys/blog_repoistory.dart';
import 'package:provider/provider.dart';

import '../models/blog.dart';
import '../providers/BlogProvider.dart';

class BlogList extends StatelessWidget {
  const BlogList({super.key});

  @override
  Widget build(BuildContext context) {
    var blogProvider = Provider.of<BlogProvider>(context);
    var blogs = blogProvider.blogs;

    BlogRepository blogRepository = BlogRepository.instance;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      subtitle: Text(blogs[index].content),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                blogRepository.toggleLikeInfo(blogs[index].id);
                                blogProvider.refresh();
                              },
                              child: Icon(blogs[index].isLikedByMe
                                  ? Icons.favorite
                                  : Icons.favorite_outline)),
                          ElevatedButton(
                            onPressed: () {
                              blogProvider.deleteBlogPost(blogs[index]);
                            },
                            child: const Icon(Icons.delete),
                          ),
                        ],
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
