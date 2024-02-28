import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<NavigateToHomeScreen>(goToHomePAgeEvent);
    on<SplashInitialEvent>(initEvent);
  }

  FutureOr<void> goToHomePAgeEvent(NavigateToHomeScreen event, Emitter<SplashState> emit) async {
    emit(loadinBtnState());
    await Future.delayed(Duration(seconds: 1));
    emit(HomeScreenNavigation());
    emit(SplashInitialState());
  }

  FutureOr<void> initEvent(SplashInitialEvent event, Emitter<SplashState> emit) async {
    emit(SplashInitialState());
  }
}
