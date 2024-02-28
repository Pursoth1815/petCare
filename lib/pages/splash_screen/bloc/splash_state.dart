part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

sealed class SplashActionState extends SplashState {}

final class SplashInitialState extends SplashState {}

final class loadinBtnState extends SplashState {}

final class HomeScreenNavigation extends SplashActionState {}
