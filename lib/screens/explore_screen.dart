import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/app_text_style.dart';
import 'package:news_app/screens/pages/explorePages/bloc/bloc.dart';
import 'package:news_app/screens/pages/explorePages/explore_starter_page.dart';
import 'package:news_app/screens/pages/explorePages/topic_select_page.dart';
import 'package:news_app/screens/pages/userAuthPage/bloc/auth_bloc.dart';
import 'package:news_app/screens/pages/userAuthPage/bloc/auth_state.dart';
import 'package:news_app/widgets/auth_widget/login.dart';

import '../config/themes/app_colors.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blackColor,
      child: BlocProvider<ExploreBloc>(
          create: (context) => ExploreBloc(),
          child: SafeArea(child: BlocBuilder<AuthBloc, AuthState>(
            builder: ((context, state) {
              if (state is LogInSuccess) {
                return const TopicSelect();
              } else {
                return ExploreStarter(context: context);
              }
            }),
          ))),
    );
  }
}
