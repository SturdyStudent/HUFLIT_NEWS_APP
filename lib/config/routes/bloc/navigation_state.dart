import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class Opened extends NavigationState {
  final int pageIndex;

  const Opened({required this.pageIndex});

  @override
  List<Object> get props => [pageIndex];
}
