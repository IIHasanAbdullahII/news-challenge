import 'package:clean_architecture_2/features/news_app/domain/entity/news_entity.dart';
import 'package:clean_architecture_2/features/news_app/presentation/blocs/news_cubit_event_bloc.dart';
import 'package:clean_architecture_2/features/news_app/presentation/pages/news_page_view_screen/widgets/custom_list_tile.dart';
import 'package:clean_architecture_2/features/news_app/presentation/widgets/list_skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final Map<String, dynamic> _news = {};

  
  @override
  void initState() {
    super.initState();
    context.read<ShowNewsCubit>().fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(onRefresh: () {
          return refresh();
        }, child: BlocBuilder<ShowNewsCubit, NewsState>(
          builder: (_, state) {
            return state.when(
                loading: () => const ListSkeletonWidget(),
                success: (data) {
                  Map<String, dynamic> intoMap = convertDataIntoMap(data.news);
                  _news.addAll(intoMap);
                  return NewsViewListWidget(newsList: _news);
                },
                failure: (message) {
                  return Center(
                    child: Text(message),
                  );
                });
          },
        )),
      ),
    );
  }

  refresh() {    
    _news.clear();    
    return context.read<ShowNewsCubit>().refreshNews();
  }

  Map<String, dynamic> convertDataIntoMap(News? data) {
    Map<String, dynamic> mapData = {
      'status': data!.status,
      'totalResults': data.totalResults,
      'articles': data.articles
    };
    return mapData;
  }
}

// ignore: must_be_immutable
class NewsViewListWidget extends StatelessWidget {
  Map<String, dynamic>? newsList;
  NewsViewListWidget({super.key, this.newsList});

  @override
  Widget build(BuildContext context) {
    List<dynamic> results = newsList!['articles'] ?? [];
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return CustomListTile(news: results[index]);
        });
  }
}
