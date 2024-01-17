import 'package:clean_architecture_2/features/news_app/presentation/pages/news_page_view_screen/widgets/custom_list_widget.dart';
import 'package:flutter/material.dart';


class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(      
      body: ListWidget(),
    );
  }
  }


