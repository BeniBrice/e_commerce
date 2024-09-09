import 'package:e_commerce/common/utils/kcolors.dart';
import 'package:e_commerce/common/widgets/app_style.dart';
import 'package:e_commerce/common/widgets/back_button.dart';
import 'package:e_commerce/common/widgets/reusable_text.dart';
import 'package:e_commerce/src/categories/controller/categories_notify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: ReusableText(
          text: context.read<CategoriesNotify>().categories,
          style: appStyle(
            16,
            Kolors.kPrimary,
            FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
