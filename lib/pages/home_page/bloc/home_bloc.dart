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
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(fetchLists);
    on<CategoryClickEvent>(updateCategoryList);
    on<PetFavoriteItemAddEvent>(updatePetFavoriteList);
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

    emit(ListLoddedSuccessState(categoryList: categoryList, petList: petDetails));
  }

  FutureOr<void> updateCategoryList(CategoryClickEvent event, Emitter<HomeState> emit) async {
    final updatedList = (state as ListLoddedSuccessState).categoryList.map((item) {
      if (item.id == event.selectedCategory.id) {
        return item.copyWith(selected: true);
      } else {
        return item.copyWith(selected: false);
      }
    }).toList();

    emit(ListLoddedSuccessState(categoryList: updatedList, petList: (state as ListLoddedSuccessState).petList));
  }

  FutureOr<void> updatePetFavoriteList(PetFavoriteItemAddEvent event, Emitter<HomeState> emit) async {
    PetListRepo repo = PetListRepo();

    final updatedList = (state as ListLoddedSuccessState).petList.map((item) {
      if (item.id == event.favoriteItem.id) {
        repo.toggleFavorite(item);
      }
      return item;
    }).toList();

    emit(ListLoddedSuccessState(categoryList: (state as ListLoddedSuccessState).categoryList, petList: updatedList));
  }
}
