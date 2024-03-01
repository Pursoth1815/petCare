// ignore_for_file: unused_element

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pet_care/data/pet_category_repo.dart';
import 'package:pet_care/data/pet_list_repo.dart';
import 'package:pet_care/pages/details_page/models/pet_details_model.dart';
import 'package:pet_care/pages/details_page/models/pet_list_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  //local list

  List<PetDetailsModel> _petList = [];
  List<PetListModel> _categoryList = [];

  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(fetchLists);
    on<CategoryClickEvent>(updateCategoryList);
    on<PetFavoriteItemAddEvent>(updatePetFavoriteList);
    on<GoToDetailsEvent>(
      (event, emit) {
        emit(GoToDetailsState(petList: event.selectedItem));
      },
    );
  }
  FutureOr<void> fetchLists(HomeInitialEvent event, Emitter<HomeState> emit) async {
    //List Fetched Through Here
    PetListRepo repo = PetListRepo();

    List<PetListModel> categoryList = PetCategoryRepo.petCategoryList.map((e) => PetListModel.fromMap(e)).toList();

    List<PetDetailsModel> petDetails = PetListRepo.petDetailsList.map((e) => PetDetailsModel.fromMap(e)).toList();

    petDetails.forEach((item) {
      if (repo.petFavoriteLists.contains(item.id)) {
        item.favorite = true;
      }
    });

    _petList = petDetails;
    _categoryList = categoryList;

    emit(ListLoddedSuccessState(categoryList: categoryList, petList: petDetails));
  }

  FutureOr<void> updateCategoryList(CategoryClickEvent event, Emitter<HomeState> emit) async {
    final updatedList = _categoryList.map((item) {
      if (item.id == event.selectedCategory.id) {
        return item.copyWith(selected: true);
      } else {
        return item.copyWith(selected: false);
      }
    }).toList();

    _categoryList = updatedList;

    emit(ListLoddedSuccessState(categoryList: updatedList, petList: _petList));
  }

  FutureOr<void> updatePetFavoriteList(PetFavoriteItemAddEvent event, Emitter<HomeState> emit) async {
    PetListRepo repo = PetListRepo();

    final updatedList = _petList.map((item) {
      if (item.id == event.favoriteItem.id) {
        repo.toggleFavorite(item);
      }
      return item;
    }).toList();

    emit(ListLoddedSuccessState(categoryList: _categoryList, petList: updatedList));
  }
}
