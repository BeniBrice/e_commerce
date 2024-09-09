import 'package:e_commerce/src/home/controller/home_tab_notify.dart';
import 'package:e_commerce/src/home/widget/categories_list.dart';
import 'package:e_commerce/src/home/widget/home_header.dart';
import 'package:e_commerce/src/home/widget/home_slider.dart';
import 'package:e_commerce/src/home/widget/home_tabs.dart';
import 'package:e_commerce/src/products/widget/explore_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widget/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
      length: homeTabs.length,
      vsync: this,
    )..addListener(_handleSelection);

    super.initState();
  }

  void _handleSelection() {
    final controller = Provider.of<HomeTabNotify>(
      context,
      listen: false,
    );
    if (_tabController.indexIsChanging) {
      controller.setIndex = homeTabs[_tabController.index];
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: CustomAppBar(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        children: [
          SizedBox(
            height: 20.h,
          ),
          const HomeSlider(),
          SizedBox(
            height: 20.h,
          ),
          const HomeHeader(),
          SizedBox(
            height: 10.h,
          ),
          const HomeCategoriesList(),
          SizedBox(
            height: 15.h,
          ),
          HomeTabs(tabController: _tabController),
          SizedBox(
            height: 15.h,
          ),
          const ExploreProduct(),
        ],
      ),
    );
  }
}

List<String> homeTabs = [
  'All',
  'Popular',
  'Unisex',
  'Men',
  'Women',
  'kids',
];
