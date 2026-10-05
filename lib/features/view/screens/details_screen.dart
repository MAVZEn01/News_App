import 'package:flutter/material.dart';
import 'package:news_app/features/view/screens/home_screen.dart';

class DetailsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff1877f2),
        title: Text(
          "Details News",
          style: TextStyle(
            fontSize: 25,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,

          children: [
            SizedBox(height: 30),
            ImageNews(height: 250),
            SizedBox(height: 30),
            Text(
              "Cristiano Ronaldo confirms decision on club future after epic Nations League triumph",
              style: TextStyle(
                fontSize: 18,
                fontWeight: .w400,
                color: Color(0xffE4E6EB),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "TheGoat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: .w400,
                color: Color(0xffB0B3B8),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Cristiano Ronaldo confirms decision on club future after epic Nations League triumph",
              style: TextStyle(
                fontSize: 16,
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
