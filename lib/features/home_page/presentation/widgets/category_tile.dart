import 'package:flutter/material.dart';
import 'package:pet_care/core/constants/colors.dart';
import 'package:pet_care/features/details_page/data/models/pet_list_model.dart';
import 'package:pet_care/features/home_page/presentation/bloc/home_bloc.dart';

class Category_Tile extends StatelessWidget {
  final HomeBloc bloc;
  final PetListModel categoryList;
  const Category_Tile({
    super.key,
    required this.bloc,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bloc.add(CategoryClickEvent(selectedCategory: categoryList)),
      child: SizedBox(
        width: 75,
        height: 100,
        child: Column(
          children: [
            Card(
              key: ValueKey(categoryList.id),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: categoryList.selected ? AppColors.lightPink : AppColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    categoryList.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              categoryList.name,
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
