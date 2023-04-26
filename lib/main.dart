import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/routes/routing.dart';
import 'package:news_app/resources/repository.dart';
import 'package:news_app/screens/pages/homePage/bloc/bloc.dart';
import 'package:news_app/screens/pages/newsDetail/bloc/bloc.dart';
import 'package:news_app/config/routes/bloc/bloc.dart';

import 'firebase_options.dart';
import 'screens/pages/userAuthPage/bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBzZ2g7K4JlopnPH_GWrDRZiRxU5M9H6co",
          appId: '1:238229423756:web:387e774d245e0f04e2dda9',
          messagingSenderId: "238229423756",
          projectId: "huflit-news-app"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
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
        child: FutureBuilder(builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text("sục xét");
          }
          if (snapshot.hasError) {
            return Text("Something shit");
          } else {
            return CircularProgressIndicator();
          }
        }));
  }
}
