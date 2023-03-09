import 'package:equatable/equatable.dart';

import '../../../../models/article.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class Loading extends NewsState {} //định nghĩa state Loading, loaded,

class Loaded extends NewsState {
  final List<Article> items;
  final String type;

  const Loaded({required this.items, required this.type});

  @override
  List<List<Article>> get props => [items];

  @override
  String toString() => 'Loaded { items: ${items.length} }';
}

class Failure extends NewsState {}
