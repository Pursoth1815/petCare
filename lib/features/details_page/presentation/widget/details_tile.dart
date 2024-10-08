import 'package:flutter/material.dart';
import 'package:pet_care/core/constants/colors.dart';
import 'package:pet_care/core/constants/constants.dart';
import 'package:pet_care/features/details_page/data/models/pet_details_model.dart';

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
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(35),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: AppConstants.screenWidth * 0.1, left: AppConstants.screenWidth * 0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            petList.petname,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
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
                    margin: EdgeInsets.only(right: AppConstants.screenWidth * 0.1),
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
          top: AppConstants.screenWidth * 0.03,
          right: AppConstants.screenWidth * 0.04,
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
