import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  final Map<String, dynamic> newsDetail;
  const NewsDetailScreen({super.key ,required this.newsDetail});

  

  @override
  Widget build(BuildContext context) {
    print(newsDetail);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(              
                image: DecorationImage(
                  image: NetworkImage(newsDetail['urlToImage']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Container(
                height: 45,
                width: 45,
                child: FittedBox(
                  child: FloatingActionButton(onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,),
                  backgroundColor: Colors.white.withOpacity(0.7),
                  elevation: 0,
                  
                  ),
                ),
              ),
            ),
      
              ],
            ),
            
            
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                newsDetail['title'],
                style:
                    const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                newsDetail['description'], style: TextStyle(
                  fontSize: 15.0
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}