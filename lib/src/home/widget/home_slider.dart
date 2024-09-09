import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/utils/kcolors.dart';
import 'package:e_commerce/common/utils/kstrings.dart';
import 'package:e_commerce/common/widgets/app_style.dart';
import 'package:e_commerce/common/widgets/custom_button.dart';
import 'package:e_commerce/common/widgets/reusable_text.dart';
import 'package:e_commerce/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kRadiusAll,
      child: Stack(
        children: [
          SizedBox(
            height: ScreenUtil().screenHeight * 0.16,
            width: ScreenUtil().screenWidth,
            child: 
            
            ImageSlideshow(
              autoPlayInterval: 5000,
              isLoop: true,
              indicatorColor: Kolors.kPrimaryLight,
              onPageChanged: (page) {},
              children: List.generate(
                imageUrls.length,
                (index) {
                  return CachedNetworkImage(
                    imageUrl: imageUrls[index],
                    placeholder: placeholder,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          
          ),
          Positioned(
            child: SizedBox(
              height: ScreenUtil().screenHeight * 0.16,
              width: ScreenUtil().screenWidth,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: AppText.kCollection,
                      style: appStyle(
                        20,
                        Kolors.kDark,
                        FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Discount 50% off  \n the first transaction',
                      style: appStyle(
                        14,
                        Kolors.kDark.withOpacity(.6),
                        FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButton(
                      text: 'Shop Now',
                      btnWidth: 120.w,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> imageUrls = [
  "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fslider1.png?alt=media&token=8b27e621-e5ea-4ba4-ab15-0302d02c75f3",
  "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fslider1.png?alt=media&token=8b27e621-e5ea-4ba4-ab15-0302d02c75f3",
  "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fslider1.png?alt=media&token=8b27e621-e5ea-4ba4-ab15-0302d02c75f3",
  "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fslider1.png?alt=media&token=8b27e621-e5ea-4ba4-ab15-0302d02c75f3",
  "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fslider1.png?alt=media&token=8b27e621-e5ea-4ba4-ab15-0302d02c75f3",
];
