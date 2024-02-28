part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class CategoryClickEvent extends HomeEvent {
  final PetListModel selectedCategory;
  CategoryClickEvent({required this.selectedCategory});
}

class PetFavoriteItemAddEvent extends HomeEvent {
  final PetDetailsModel favoriteItem;
  PetFavoriteItemAddEvent({required this.favoriteItem});
}
