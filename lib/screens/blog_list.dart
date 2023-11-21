import 'package:flutter/material.dart';

import '../models/blog.dart';

class BlogList extends StatefulWidget {
  const BlogList({super.key});

  @override
  State<BlogList> createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  List<Blog> blogList = [
    Blog("Blog 1", "This is blog 1", "JFK"),
    Blog("Blog 2", "This is blog 2", "JFK"),
    Blog("Blog 3", "This is blog 3", "JFK")
  ];

  void addBlog(Blog blog) {
    setState(() {
      blogList.add(blog);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: blogList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(blogList[index].title),
                          ),
                          Text(blogList[index].author,
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 12)),
                        ],
                      ),
                      subtitle: Text(blogList[index].content),
                      trailing: ElevatedButton(
                        child: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            blogList.removeAt(index);
                          });
                        },
                      )),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => addBlog(Blog("New Blog ${blogList.length + 1}",
              "This is a new blog yay", "Obama"))),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
