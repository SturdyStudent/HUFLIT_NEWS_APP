import 'package:equatable/equatable.dart';

import '../../../../models/article.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class LoadingDetail extends DetailState {} //định nghĩa state Loading, loaded,

class LoadedArticle extends DetailState {
  final Article selectedArticle;

  const LoadedArticle({required this.selectedArticle});

  @override
  List<Article> get props => [selectedArticle];

  @override
  String toString() => 'Loaded article { items: ${selectedArticle.source} }';
}

class FailureArticle extends DetailState {}
