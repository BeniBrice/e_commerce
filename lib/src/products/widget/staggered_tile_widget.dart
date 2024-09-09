import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/utils/kcolors.dart';
import 'package:e_commerce/common/widgets/app_style.dart';
import 'package:e_commerce/common/widgets/reusable_text.dart';
import 'package:e_commerce/src/products/controller/product_notifier.dart';
import 'package:e_commerce/src/products/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StaggeredTileWidget extends StatelessWidget {
  const StaggeredTileWidget(
      {super.key, required this.i, required this.products, this.onTap});
  final int i;
  final Products products;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ProductNotifier>().setProduct = products;
        context.push('/product/${products.id}');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Kolors.kWhite,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Kolors.kPrimary,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: products.imageUrls[0],
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Positioned(
                          right: 10.h,
                          top: 10.h,
                          child: const CircleAvatar(
                            backgroundColor: Kolors.kSecondaryLight,
                            child: Icon(
                              AntDesign.heart,
                              color: Kolors.kRed,
                              size: 18,
                            ),
                          )),
                    )
                 
                 
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        products.title,
                        overflow: TextOverflow.ellipsis,
                        style: appStyle(
                          13,
                          Kolors.kDark,
                          FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          AntDesign.star,
                          color: Kolors.kGold,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        ReusableText(
                          text: products.ratings.toStringAsFixed(1),
                          style: appStyle(
                            13,
                            Kolors.kGray,
                            FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                ),
                child: ReusableText(
                  text: '\$ ${products.price.toStringAsFixed(2)}',
                  style: appStyle(
                    17,
                    Kolors.kDark,
                    FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
