import 'package:e_commerce/common/utils/kcolors.dart';
import 'package:e_commerce/common/utils/kstrings.dart';
import 'package:e_commerce/common/widgets/app_style.dart';
import 'package:e_commerce/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreenTwo extends StatelessWidget {
  const OnBoardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              R.ASSETS_IMAGES_WISHLIST_PNG,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 30,
            right: 30,
            child: Text(
              textAlign: TextAlign.center,
              AppText.kOnboardWishListMessage,
              style: appStyle(
                15,
                Kolors.kGray,
                FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
