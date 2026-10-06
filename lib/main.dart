import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_route.dart';
import 'package:news_app/data/api/app_api.dart';
import 'package:news_app/features/view/screens/details_screen.dart';
import 'package:news_app/features/view/screens/home_screen.dart';

void main() {
  AppApi.getNews();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.home,
      routes: {
        AppRoute.details: (context) => DetailsScreen(),
        AppRoute.home: (context) => HomeScreen(),
      },
    );
  }
}
