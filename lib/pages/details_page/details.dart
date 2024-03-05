import 'package:flutter/material.dart';
import 'package:pet_care/common/utils/app_const.dart';
import 'package:pet_care/common/utils/colors.dart';
import 'package:pet_care/common/utils/constants.dart';
import 'package:pet_care/common/utils/image_string.dart';
import 'package:pet_care/pages/details_page/UI/details_tile.dart';
import 'package:pet_care/pages/details_page/UI/pet_info_tile.dart';
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
        alignment: Alignment.topCenter,
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
                height: AppConstants.screenHeight * 0.5,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: AppConstants.screenWidth,
              height: AppConstants.screenHeight * 0.6,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.screenWidth * 0.05, vertical: AppConstants.screenHeight * 0.02),
              decoration: BoxDecoration(
                color: AppColors.whiteLite,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45),
                ),
              ),
              child: ListView(
                children: [
                  // Pet details Content
                  Container(
                    margin: EdgeInsets.only(top: AppConstants.screenHeight * 0.02),
                    width: AppConstants.screenWidth,
                    height: AppConstants.screenHeight * 0.15,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PetInfo(title: "Age", value: list.age),
                          PetInfo(title: "Sex", value: list.sex),
                          PetInfo(title: "Color", value: list.color),
                          PetInfo(title: "Length", value: list.length),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors.DarkPink,
                  ),

                  // Owner Details Content
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(list.ownerImgUrl),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                list.ownername,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                AppConst.owner,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Description

                  Container(
                    height: AppConstants.screenHeight * 0.15,
                    margin: EdgeInsets.only(top: 15),
                    child: Text(
                      list.ownerDesc,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  Spacer(),
                  //Button
                  SizedBox(
                    width: AppConstants.screenWidth,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(AppColors.Pink),
                      ),
                      child: Text(
                        AppConst.adoption.toUpperCase(),
                        style: TextStyle(
                          color: AppColors.white,
                          letterSpacing: 5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: AppConstants.screenHeight * 0.32,
            child: Hero(
              tag: list.id,
              child: Details_Tile(petList: list),
            ),
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
