import 'package:clean_architecture_2/features/news_app/presentation/pages/news_detail_screen/news_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Map<String, dynamic> news;

  CustomListTile({required this.news});

  @override
  Widget build(BuildContext context) {
    if (news['urlToImage'] == null || news['title'] == null || news['description'] == null) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(newsDetail: news,),            
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 4.0),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: news['urlToImage'],
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) {
                  print('Image loading error: $error');
                  return Image.asset(
                    'assets/images/error.png', 
                    fit: BoxFit.cover,
                  );})             
            ),
            const SizedBox(height: 15.0),
            Text(
              news['title']!,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15.0),
            Text(
              news['description'] != null ? news['description']! : 'Empty',
            ),
          ],
        ),
      ),
    );
  }
}
