import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Repository repository;

  NewsBloc({required this.repository}) : super(Loading()) {
    on<Fetch>((event, emit) async {
      try {
        emit(Loading());
        final items = await repository.fetchAllNews(category: event.type);

        if (items != null) {
          emit(Loaded(items: items, type: event.type));
        }
      } catch (error) {
        log("Error", error: error);
        emit(Failure());
      }
    });
  }
}
