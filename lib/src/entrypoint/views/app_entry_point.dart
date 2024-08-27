// ignore_for_file: must_be_immutable

import 'package:e_commerce/common/utils/kcolors.dart';
import 'package:e_commerce/common/widgets/app_style.dart';
import 'package:e_commerce/src/cart/views/cart_screen.dart';
import 'package:e_commerce/src/entrypoint/controller/bottom_tab_notifier.dart';
import 'package:e_commerce/src/home/views/home_screen.dart';
import 'package:e_commerce/src/profile/views/profile_screen.dart';
import 'package:e_commerce/src/wishlist/views/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class AppEntryPoint extends StatelessWidget {
  AppEntryPoint({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const WishListPage(),
    const CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
      builder: (context, tabIndexNotifier, child) => Scaffold(
        body: Stack(
          children: [
            pageList[tabIndexNotifier.index],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Kolors.kOffWhite,
                ),
                child: BottomNavigationBar(
                  selectedFontSize: 12,
                  elevation: 0,
                  backgroundColor: Kolors.kOffWhite,
                  showSelectedLabels: true,
                  selectedLabelStyle: appStyle(
                    14,
                    Kolors.kPrimary,
                    FontWeight.w500,
                  ),
                  showUnselectedLabels: false,
                  unselectedItemColor: Kolors.kGray,
                  selectedItemColor: Kolors.kPrimary,
                  currentIndex: tabIndexNotifier.index,
                  unselectedIconTheme: const IconThemeData(
                    color: Colors.black38,
                  ),
                  onTap: (i) {
                    tabIndexNotifier.setIndex = i;
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        AntDesign.home,
                        color: Kolors.kPrimary,
                        size: 24,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Ionicons.heart_outline,
                        color: Kolors.kPrimary,
                        size: 24,
                      ),
                      label: 'WishList',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        MaterialCommunityIcons.shopping_outline,
                        color: Kolors.kPrimary,
                        size: 24,
                      ),
                      label: 'Cart',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        EvilIcons.user,
                        color: Kolors.kPrimary,
                        size: 34,
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
