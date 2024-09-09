import 'package:e_commerce/common/services/storage.dart';
import 'package:e_commerce/common/utils/kcolors.dart';
import 'package:e_commerce/common/widgets/login_bottom_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

class WidgetNotification extends StatelessWidget {
  const WidgetNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Storage().getString('accessToken') == null) {
          if (kDebugMode) {
            loginBottomSheet(context);
          }
        } else {
          context.push('/notifications');
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(
          right: 12,
        ),
        child: CircleAvatar(
          backgroundColor: Kolors.kGrayLight.withOpacity(
            .3,
          ),
          child: const Badge(
            label: Text('4'),
            child: Icon(
              Ionicons.notifications,
              color: Kolors.kPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
