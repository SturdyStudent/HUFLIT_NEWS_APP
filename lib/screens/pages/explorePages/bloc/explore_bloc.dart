import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/pages/explorePages/bloc/explore_state.dart';

import 'explore_event.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(SelectTopicState()) {
    on<NavigateSelectTime>((event, emit) {
      emit(SelectTimeState());
    });
    on<NavigatePreviewArticle>(
      (event, emit) {
        emit(PreviewArticleState());
      },
    );
  }
}
