import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const Opened(pageIndex: 0)) {
    // ignore: void_checks
    on<Navigate>((event, emit) async* {
      // ignore: unnecessary_type_check
      if (event is Navigate) {
        print(event.pageIndex);
        yield Opened(pageIndex: event.pageIndex ?? 0);
      }
    });
  }
}
