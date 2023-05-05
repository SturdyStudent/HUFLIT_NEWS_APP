import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/routes/routing.dart';
import 'package:news_app/resources/repository.dart';
import 'package:news_app/screens/pages/homePage/bloc/bloc.dart';
import 'package:news_app/screens/pages/newsDetail/bloc/bloc.dart';
import 'package:news_app/config/routes/bloc/bloc.dart';

import 'screens/pages/userAuthPage/bloc/bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();

    // ignore: prefer_const_constructors
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
          BlocProvider<NewsBloc>(
              create: (context) => NewsBloc(repository: Repository())
                ..add(const Fetch(type: 'General'))),
          BlocProvider<DetailBloc>(create: (context) => DetailBloc()),
          BlocProvider<NavigationBloc>(create: (context) => NavigationBloc())
        ],
        child: MaterialApp(
            scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
            initialRoute: '/',
            onGenerateRoute: onGenerate,
            debugShowCheckedModeBanner: false));
  }
}
