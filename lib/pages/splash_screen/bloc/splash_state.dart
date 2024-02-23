part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

sealed class SplashActionState extends SplashState {}

final class SplashInitial extends SplashState {}

final class HomeScreenNavigation extends SplashState {}
