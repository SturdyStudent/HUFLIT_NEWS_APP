import 'package:equatable/equatable.dart';

abstract class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

class SelectTopicState extends ExploreState {}

class SelectTimeState extends ExploreState {}

class PreviewArticleState extends ExploreState {}
