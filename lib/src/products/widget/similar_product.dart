import 'package:e_commerce/common/services/storage.dart';
import 'package:e_commerce/common/widgets/login_bottom_sheet.dart';
import 'package:e_commerce/const/constants.dart';
import 'package:e_commerce/src/products/model/products_model.dart';
import 'package:e_commerce/src/products/widget/staggered_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SimilarProduct extends StatelessWidget {
  const SimilarProduct({super.key});

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(
          productss.length,
          (index) {
            final double mainAxisCellCount = (index % 2 == 0 ? 2.17 : 2.4);

            return StaggeredGridTile.count(
              mainAxisCellCount: mainAxisCellCount,
              crossAxisCellCount: 2,
              child: StaggeredTileWidget(
                onTap: () {
                  if (accessToken == null) {
                    loginBottomSheet(context);
                    print(productss.length);
                  } else {
                    ///TODO:handle wisho
                    print(products.length);
                  }
                },
                i: index,
                products: productss[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

List<Products> productss = [
  Products(
      id: 3,
      title: "Converse Chuck Taylor All Star",
      price: 60.0,
      description:
          "The classic Chuck Taylor All Star sneaker from Converse, featuring a timeless design and comfortable fit.",
      isFeatured: true,
      clothesType: "kids",
      ratings: 4.333333333333333,
      colors: ["black", "white", "red"],
      imageUrls: [
        "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp",
        "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp"
      ],
      sizes: ["7", "8", "9", "10", "11"],
      createdAt: DateTime.parse("2024-06-06T07:57:45Z"),
      category: 3,
      brand: 1),
  Products(
      id: 1,
      title: "LV Trainers",
      price: 798.88,
      description:
          "LV Trainers blend sleek style with athletic functionality, featuring bold logos, premium materials, and comfortable designs that elevate your everyday look with a touch of luxury.",
      isFeatured: true,
      clothesType: "women",
      ratings: 4.5,
      colors: ["white", "black", "red"],
      imageUrls: [
        "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp",
        "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp"
      ],
      sizes: ["7", "8", "9", "10", "11"],
      createdAt: DateTime.parse("2024-06-06T07:49:15Z"),
      category: 3,
      brand: 1),
  Products(
    id: 2,
    title: "Adidas Ultraboost",
    price: 180.0,
    description:
        "Experience the comfort and energy return of the Ultraboost, designed for running and everyday wear.",
    isFeatured: true,
    clothesType: "unisex",
    ratings: 5.0,
    colors: ["navy", "grey", "blue"],
    imageUrls: [
      "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp",
      "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp"
    ],
    sizes: ["7", "8", "9", "10", "11"],
    createdAt: DateTime.parse("2024-06-06T07:55:20Z"),
    category: 3,
    brand: 1,
  )
];
