import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/repository.dart';
import 'detail_event.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final Repository? repository;

  DetailBloc({this.repository}) : super(LoadingDetail()) {
    // ignore: void_checks
    on<SelectNewsForDetail>((event, emit) async {
      try {
        emit(LoadedArticle(selectedArticle: event.article));
      } catch (err) {
        emit(FailureArticle());
      }
    });
  }
}
