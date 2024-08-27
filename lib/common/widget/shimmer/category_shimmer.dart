import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 12),
      height: 75.h,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return const Column(
            children: [],
          );
        },
      ),
    );
  }
}
