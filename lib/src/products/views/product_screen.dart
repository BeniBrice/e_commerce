import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/services/storage.dart';
import 'package:e_commerce/common/utils/kcolors.dart';
import 'package:e_commerce/common/utils/kstrings.dart';
import 'package:e_commerce/common/widgets/app_style.dart';
import 'package:e_commerce/common/widgets/back_button.dart';
import 'package:e_commerce/common/widgets/error_modal.dart';
import 'package:e_commerce/common/widgets/login_bottom_sheet.dart';
import 'package:e_commerce/common/widgets/reusable_text.dart';
import 'package:e_commerce/const/constants.dart';
import 'package:e_commerce/src/products/controller/colors_size_notifiy.dart';
import 'package:e_commerce/src/products/controller/product_notifier.dart';
import 'package:e_commerce/src/products/widget/colors_selection_widget.dart';
import 'package:e_commerce/src/products/widget/expandable_text.dart';
import 'package:e_commerce/src/products/widget/product_bottom_bar.dart';
import 'package:e_commerce/src/products/widget/product_sizes.dart';
import 'package:e_commerce/src/products/widget/similar_product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    print(context.read<ProductNotifier>().product!.title);
    return Consumer<ProductNotifier>(
      builder: (context, pNotifier, child) => Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Kolors.kWhite,
                expandedHeight: 320.h,
                collapsedHeight: 65.h,
                floating: false,
                pinned: true,
                leading: const AppBackButton(),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: ImageSlideshow(
                    autoPlayInterval: 5000,
                    isLoop:
                        pNotifier.product!.imageUrls.length == 1 ? false : true,
                    indicatorColor: const Color.fromRGBO(180, 112, 67, 1),
                    children: List.generate(
                      pNotifier.product!.imageUrls.length,
                      (index) {
                        return SizedBox(
                          height: 415.h,
                          child: CachedNetworkImage(
                            imageUrl: pNotifier.product!.imageUrls[index],
                            placeholder: placeholder,
                            height: 415.h,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Kolors.kSecondaryLight,
                        child: Icon(
                          AntDesign.heart,
                          color: Kolors.kRed,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: pNotifier.product!.clothesType.toUpperCase(),
                        style: appStyle(
                          13,
                          Kolors.kGray,
                          FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            AntDesign.star,
                            color: Kolors.kGold,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ReusableText(
                            text: pNotifier.product!.ratings.toStringAsFixed(1),
                            style: appStyle(
                              13,
                              Kolors.kGray,
                              FontWeight.normal,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ReusableText(
                    text: pNotifier.product!.title,
                    style: appStyle(
                      16,
                      Kolors.kDark,
                      FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.all(8.h),
                    child:
                        ExpandableText(text: pNotifier.product!.description)),
              ),
              SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                    ),
                    child: Divider(
                      thickness: .5.h,
                    )),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ReusableText(
                    text: 'Select Sizes',
                    style: appStyle(
                      16,
                      Kolors.kDark,
                      FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ProductSizesWidget(),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ReusableText(
                    text: 'Select Color',
                    style: appStyle(
                      16,
                      Kolors.kDark,
                      FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ColorsSelectionWidget(),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ReusableText(
                    text: 'Similar products',
                    style: appStyle(
                      16,
                      Kolors.kDark,
                      FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: const SimilarProduct(),
                ),
              ),
            ],
          ),
          bottomNavigationBar: ProductBottomBar(
            onPressed: () {
              if (accessToken == null) {
                loginBottomSheet(context);
              } else {
                if (context.read<ColorsSizeNotifiy>().colors == '' ||
                    context.read<ColorsSizeNotifiy>().sizes == '') {
                  showErrorPopup(context, AppText.kCartErrorText,
                      "Error adding to cart", true);
                } else {
                  if (kDebugMode) {
                    ///TODO: CART LOGIC
                  }
                }
              }
            },
            price: pNotifier.product!.price.toStringAsFixed(2),
          )),
    );
  }
}
