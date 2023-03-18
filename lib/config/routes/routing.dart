import 'package:news_app/screens/explore_screen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/screens/pages/explorePages/welcome_back.dart';
import 'package:news_app/screens/pages/newsDetail/news_detail_page.dart';
import 'package:news_app/screens/splash_screen.dart';

Route onGenerate(RouteSettings settings) {
  return PageRouteBuilder(
      pageBuilder: (context, anim1, anim2) =>
          getRoute(settings.name.toString()));
}

Widget getRoute(String name) {
  switch (name) {
    case '/':
      return const SplashScreen();
    case '/home':
      return const HomeScreen();
    case '/explore':
      return const ExploreScreen();
    case '/explore/welcome':
      return const WelcomeBack();
    case '/videos':
      return const Text('Video page');
    case '/detail':
      return const NewsDetailPage();
    default:
      return ErrorWidget('Không tìm thấy đường dẫn cho $name');
  }
}
