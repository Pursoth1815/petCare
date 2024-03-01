import 'package:flutter/material.dart';
import 'package:pet_care/common/utils/colors.dart';
import 'package:pet_care/common/utils/constants.dart';
import 'package:pet_care/pages/details_page/UI/details_tile.dart';
import 'package:pet_care/pages/details_page/models/pet_details_model.dart';

class PetDetails extends StatefulWidget {
  final PetDetailsModel petLists;
  const PetDetails({super.key, required this.petLists});

  @override
  State<PetDetails> createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {
  @override
  Widget build(BuildContext context) {
    //list
    final PetDetailsModel list = widget.petLists;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: AppConstants.screenWidth,
            height: AppConstants.screenHeight,
          ),
          Positioned(
            top: 0,
            child: Hero(
              tag: list.petImageUrl,
              child: Image.asset(
                list.petImageUrl,
                width: AppConstants.screenWidth,
                height: AppConstants.screenHeight * 0.6,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: AppConstants.screenWidth,
                height: AppConstants.screenHeight * 0.5,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Center(child: Text("Data....")),
              )),
          Hero(
            tag: list.id,
            child: Details_Tile(petList: list),
          ),
          Positioned(
            top: 30,
            left: 25,
            child: CircleAvatar(
              backgroundColor: AppColors.white.withOpacity(0.3),
              child: Icon(
                Icons.arrow_back_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
