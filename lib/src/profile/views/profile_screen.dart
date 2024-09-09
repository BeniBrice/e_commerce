import 'package:e_commerce/common/services/storage.dart';
import 'package:e_commerce/common/utils/kcolors.dart';
import 'package:e_commerce/common/utils/kstrings.dart';
import 'package:e_commerce/common/widgets/app_style.dart';
import 'package:e_commerce/common/widgets/custom_button.dart';
import 'package:e_commerce/common/widgets/help_bottom_sheet.dart';
import 'package:e_commerce/common/widgets/reusable_text.dart';
import 'package:e_commerce/src/auth/views/login_screen.dart';
import 'package:e_commerce/src/profile/widget/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? accessToken = Storage().getString('accessToken');
    if (accessToken == null) {
      return const LoginScreen();
    }
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              const CircleAvatar(
                radius: 35,
                backgroundColor: Kolors.kPrimary,
                backgroundImage: NetworkImage(
                  AppText.kProfilePic,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              ReusableText(
                text: 'Kings@gmail.com',
                style: appStyle(
                  14,
                  Kolors.kGray,
                  FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                decoration: BoxDecoration(
                  color: Kolors.kOffWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ReusableText(
                  text: 'Beni Brice',
                  style: appStyle(
                    14,
                    Kolors.kDark,
                    FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            color: Kolors.kOffWhite,
            child: Column(
              children: [
                ProfileTileWidget(
                  title: 'My orders',
                  leading: Octicons.checklist,
                  onTap: () {
                    context.push('/orders');
                  },
                ),
                ProfileTileWidget(
                  title: 'Shipping adress',
                  leading: MaterialIcons.location_pin,
                  onTap: () {
                    context.push('/addresses');
                  },
                ),
                ProfileTileWidget(
                  title: 'Privacy Policy',
                  leading: MaterialIcons.policy,
                  onTap: () {
                    context.push('/policy');
                  },
                ),
                ProfileTileWidget(
                  title: 'Help Center',
                  leading: AntDesign.customerservice,
                  onTap: () => showHelpCenterBottomSheet(context),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: CustomButton(
              text: 'Logout'.toUpperCase(),
              btnHieght: 35,
              btnColor: Kolors.kRed,
              btnWidth: ScreenUtil().screenWidth - 40,
            ),
          ),
        ],
      ),
    );
  }
}
