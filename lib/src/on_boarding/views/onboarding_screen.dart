import 'package:e_commerce/common/utils/kcolors.dart';
import 'package:e_commerce/src/on_boarding/controller/onbording_notify.dart';
import 'package:e_commerce/src/on_boarding/widget/onboarding_page_one%20copy.dart';
import 'package:e_commerce/src/on_boarding/widget/onboarding_page_two.dart';
import 'package:e_commerce/src/on_boarding/widget/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pagecontroller;
  @override
  void initState() {
    _pagecontroller = PageController(
      initialPage: context.read<OnbordingNotify>().selectedPage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pagecontroller,
            onPageChanged: (page) {
              context.read<OnbordingNotify>().setSelectedPage = page;
            },
            children: const [
              OnBoardingScreenOne(),
              OnBoardingScreenTwo(),
              WelcomeScreen(),
            ],
          ),
          context.watch<OnbordingNotify>().selectedPage == 2
              ? const SizedBox.shrink()
              : Positioned(
                  bottom: 30.h,
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        context.watch<OnbordingNotify>().selectedPage == 0
                            ? SizedBox(
                                width: 25.w,
                              )
                            : GestureDetector(
                                onTap: () {
                                  _pagecontroller.animateToPage(
                                    context
                                            .read<OnbordingNotify>()
                                            .selectedPage -
                                        1,
                                    duration: const Duration(microseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: const Icon(
                                  AntDesign.leftcircleo,
                                  color: Kolors.kPrimary,
                                  size: 30,
                                ),
                              ),
                        SizedBox(
                          height: 50.h,
                          width: ScreenUtil().screenWidth * 0.7,
                          child: PageViewDotIndicator(
                            currentItem:
                                context.watch<OnbordingNotify>().selectedPage,
                            count: 3,
                            unselectedColor: Colors.black26,
                            selectedColor: Kolors.kPrimary,
                            duration: const Duration(
                              microseconds: 200,
                            ),
                            onItemClicked: (index) {
                              _pagecontroller.animateToPage(index,
                                  duration: const Duration(microseconds: 200),
                                  curve: Curves.easeIn);
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _pagecontroller.animateToPage(
                              context.read<OnbordingNotify>().selectedPage + 1,
                              duration: const Duration(microseconds: 200),
                              curve: Curves.easeIn,
                            );
                          },
                          child: const Icon(
                            AntDesign.rightcircleo,
                            color: Kolors.kPrimary,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
