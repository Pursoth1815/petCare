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
        SizedBox(
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: AppConstants.screenWidth * 0.33,
                    height: AppConstants.screenHeight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Hero(
                        tag: petList.id,
                        child: Image.asset(
                          petList.petImageUrl,
                          fit: BoxFit.cover, // Ensure the image covers the entire area
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
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            petList.petDesc,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black38,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "₹ ${petList.amount}",
                            style: TextStyle(
                              fontSize: 20,
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
        Positioned(
          top: 10,
          right: 15,
          child: InkWell(
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
