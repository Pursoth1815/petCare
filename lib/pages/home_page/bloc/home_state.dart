part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class ListLoddedSuccessState extends HomeState {
  final List<PetListModel> categoryList;
  final List<PetDetailsModel> petList;
  ListLoddedSuccessState({required this.categoryList, required this.petList});
}

final class GoToDetailsState extends HomeActionState {}
