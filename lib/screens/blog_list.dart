import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/blog_provider.dart';
import 'blog_card.dart';

class BlogList extends StatelessWidget {
  const BlogList({super.key});

  @override
  Widget build(BuildContext context) {
    var blogProvider = Provider.of<BlogProvider>(context);
    var blogs = blogProvider.blogs;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                return BlogCard(
                  blog: blogs[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
