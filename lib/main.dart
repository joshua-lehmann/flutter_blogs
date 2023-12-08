import 'package:flutter/material.dart';
import 'package:flutter_blogs_test/models/blog.dart';
import 'package:flutter_blogs_test/providers/BlogProvider.dart';
import 'package:flutter_blogs_test/screens/blog_list.dart';
import 'package:provider/provider.dart';
import 'color_schemes.g.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => BlogProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const MyHomePage(title: 'Blog App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Consumer<BlogProvider>(
        builder: (context, blogProvider, child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Liked Blogs: ${blogProvider.likedBlogsCount}"),
                    const Expanded(child: BlogList())
                  ]),
            ),
          );
        },
      ),
    );
  }
}
