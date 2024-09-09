import 'package:e_commerce/common/utils/kcolors.dart';
import 'package:e_commerce/common/widgets/app_style.dart';
import 'package:e_commerce/src/products/controller/colors_size_notifiy.dart';
import 'package:e_commerce/src/products/controller/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductSizesWidget extends StatelessWidget {
  const ProductSizesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
    
     Consumer<ColorsSizeNotifiy>(
      builder: (context, controller, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            context.read<ProductNotifier>().product!.sizes.length,
            (index) {
              String s = context.read<ProductNotifier>().product!.sizes[index];
              return GestureDetector(
                onTap: () {
                  controller.setSizes(s);
                },
                child: Container(
                  height: 30.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    color: controller.sizes == s
                        ? Kolors.kPrimary
                        : Kolors.kGrayLight,
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      s,
                      style: appStyle(
                        20,
                        Kolors.kWhite,
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
