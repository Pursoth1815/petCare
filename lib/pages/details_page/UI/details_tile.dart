import 'package:flutter/material.dart';
import 'package:pet_care/common/utils/colors.dart';
import 'package:pet_care/common/utils/constants.dart';
import 'package:pet_care/pages/details_page/models/pet_details_model.dart';
import 'package:pet_care/pages/home_page/bloc/home_bloc.dart';

class Details_Tile extends StatelessWidget {
  final PetDetailsModel petList;
  const Details_Tile({
    super.key,
    required this.petList,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: AppConstants.screenWidth * 0.80,
          height: AppConstants.screenWidth * 0.35,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(
                  Radius.circular(35),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: AppConstants.screenWidth * 0.25,
                    height: AppConstants.screenHeight,
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        "₹ ${petList.amount}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 15,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              petList.favorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: Colors.red,
              size: 18,
            ),
          ),
        )
      ],
    );
  }
}
