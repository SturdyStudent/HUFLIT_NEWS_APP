import 'package:equatable/equatable.dart';

import '../../../../models/article.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class SelectNewsForDetail extends DetailEvent {
  final Article article;

  const SelectNewsForDetail({required this.article});

  @override
  String toString() => 'SelectNewsForDetail ${article.title} ';
}
