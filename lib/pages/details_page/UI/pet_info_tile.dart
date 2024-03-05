import 'package:flutter/material.dart';
import 'package:pet_care/common/utils/colors.dart';

class PetInfo extends StatelessWidget {
  final String title;
  final String value;
  const PetInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Container(
              width: 65,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.DarkPink,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
