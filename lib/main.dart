import 'package:clean_architecture_2/features/news_app/presentation/blocs/news_cubit_event_bloc.dart';
import 'package:clean_architecture_2/features/news_app/presentation/pages/news_page_view_screen/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocProvider(
        create: (_) => sl<ShowNewsCubit>(),
      ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewsPage(),
      ),
    );
  }
}
