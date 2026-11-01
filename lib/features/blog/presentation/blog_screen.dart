import 'package:firebase/features/blog/model/news_data_model.dart';
import 'package:firebase/features/blog/services/blog_service.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  late Future<NewsData> _newsBlogs;

  @override
  void initState() {
    _newsBlogs = NewsService().fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News & Blogs')),

      body: FutureBuilder(
        future: _newsBlogs,

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: Text('No News Found'));
          }
          final articles = snapshot.data!.articles;

          return GridView.builder(
            itemCount: articles.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final article = articles[index];

              return Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: Card(
                  child: Column(
                    children: [
                      if (article.urlToImage != null)
                        Image.network(
                          article.urlToImage!,
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      SizedBox(height: 10),
                      Text(article.title),
                      SizedBox(height: 10),
                      Text(article.description ?? 'No description'),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(article.author ?? "Iyanda001"),
                              Text(article.source.name!),
                            ],
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text("View More"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
