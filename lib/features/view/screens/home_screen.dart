import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_route.dart';
import 'package:news_app/core/routes/network/api_result.dart';
import 'package:news_app/data/api/app_api.dart';
import 'package:news_app/data/model/news_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];
  bool isLoading = true;
  String? erorr;
  @override
  void initState() {
    super.initState();
    getAllArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff1877f2),
        title: Text(
          "News",
          style: TextStyle(
            fontSize: 25,
            fontWeight: .bold,
            color: CupertinoColors.tertiarySystemGroupedBackground,
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : erorr != null
          ? Text(
              erorr ?? "",
              style: TextStyle(fontSize: 20, color: Colors.pink),
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) =>
                  NewsItems(article: articles[index]),
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemCount: articles.length,
            ),
    );
  }

  void getAllArticles() async {
    isLoading = true;
    final result = await AppApi.getNews();
    switch (result) {
      case Success<NewsModel>():
        articles = result.data.articles ?? [];
      case Error<NewsModel>():
        erorr = result.error;
    }
    isLoading = false;
    setState(() {});
  }
}

class NewsItems extends StatelessWidget {
  const NewsItems({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoute.details, arguments: article);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ImageNews(image: article.urlToImage ?? image),
            SizedBox(height: 8),
            Text(
              article.author ?? "",
              style: TextStyle(
                fontSize: 14,
                fontWeight: .w400,
                color: Color(0xffB0B3B8),
              ),
            ),
            SizedBox(height: 4),
            Text(
              article.title ?? "",
              style: TextStyle(
                fontSize: 18,
                fontWeight: .w400,
                color: Color(0xffE4E6EB),
              ),
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageNews extends StatelessWidget {
  const ImageNews({super.key, this.height = 200, required this.image});
  final double height;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(12),

      child: CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) =>
            SizedBox(width: 40, height: 40, child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
        width: double.infinity,
        height: height,
        fit: .cover,
      ),
    );
  }
}

String image =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyRVjaHvSZh0r3w9tom-kYQodGTsl8wjSDNyTvQha1jQ&s=10";
