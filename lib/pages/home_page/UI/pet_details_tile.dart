import 'package:flutter/material.dart';
import 'package:pet_care/common/utils/colors.dart';
import 'package:pet_care/common/utils/constants.dart';
import 'package:pet_care/pages/details_page/models/pet_details_model.dart';
import 'package:pet_care/pages/home_page/bloc/home_bloc.dart';

class Pet_Details_Tile extends StatelessWidget {
  final HomeBloc bloc;
  final PetDetailsModel petList;
  const Pet_Details_Tile({
    super.key,
    required this.bloc,
    required this.petList,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        GestureDetector(
          onTap: () {
            bloc.add(GoToDetailsEvent(selectedItem: petList));
          },
          child: SizedBox(
            height: AppConstants.screenWidth * 0.35,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Hero(
                      tag: petList.petImageUrl,
                      child: Container(
                        width: AppConstants.screenWidth * 0.33,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Image.asset(
                            petList.petImageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 18, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              petList.petname,
                              style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor,
                              ),
                            ),
                            Text(
                              petList.petDesc,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 11,
                                color: Colors.black38,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "₹ ${petList.amount}",
                              style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor,
                              ),
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 15,
          child: GestureDetector(
            onTap: () {
              bloc.add(PetFavoriteItemAddEvent(favoriteItem: petList));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                petList.favorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: Colors.red,
                size: 18,
              ),
            ),
          ),
        )
      ],
    );
  }
}
