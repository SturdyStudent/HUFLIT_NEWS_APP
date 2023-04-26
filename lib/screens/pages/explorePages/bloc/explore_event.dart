import 'package:equatable/equatable.dart';

abstract class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

class NavigateSelectTime extends ExploreEvent {
  const NavigateSelectTime();

  @override
  String toString() => 'Navigating Select time';
}

class NavigatePreviewArticle extends ExploreEvent {
  const NavigatePreviewArticle();

  @override
  String toString() => 'Navigating Preview Articles';
}
