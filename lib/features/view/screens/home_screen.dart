import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_route.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});

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
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) => NewsItems(),
        separatorBuilder: (context, index) => SizedBox(height: 15),
        itemCount: 10,
      ),
    );
  }
}

class NewsItems extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoute.details);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ImageNews(),
            SizedBox(height: 8),
            Text(
              "TheGoat",
              style: TextStyle(
                fontSize: 14,
                fontWeight: .w400,
                color: Color(0xffB0B3B8),
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Cristiano Ronaldo confirms decision on club future after epic Nations League triumph",
              style: TextStyle(
                fontSize: 18,
                fontWeight: .w400,
                color: Color(0xffE4E6EB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageNews extends StatelessWidget {
  const ImageNews({super.key, this.height = 200});
  final double height;
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
