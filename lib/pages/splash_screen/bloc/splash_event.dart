part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}

class SplashInitialEvent extends SplashEvent {}

class NavigateToHomeScreen extends SplashEvent {}

class loadinBtnEvent extends SplashEvent {}
