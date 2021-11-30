import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_attendance/features/07_settings/views/pages/settings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/constants.dart';
import '../../../07_settings/views/controllers/user_controller.dart';

class UserProfilePicture extends StatelessWidget {
  const UserProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppUserController>(
      builder: (controller) {
        if (controller.isUserInitialized == false) {
          return Shimmer.fromColors(
            baseColor: AppColors.shimmerBaseColor,
            highlightColor: AppColors.shimmerHighlightColor,
            child: CircleAvatar(
                backgroundImage: const AssetImage(
                  AppImages.deafaultUser,
                ),
                radius: Get.width * 0.07),
          );
        } else if (controller.isUserInitialized == true) {
          return InkWell(
            onTap: () {
              Get.to(() => const AdminSettingScreen());
            },
            child: Hero(
              tag: controller.currentUser.userID!,
              child: controller.currentUser.userProfilePicture != null
                  ? CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        controller.currentUser.userProfilePicture!,
                      ),
                      radius: Get.width * 0.07,
                    )
                  : CircleAvatar(
                      backgroundImage: const AssetImage(AppImages.deafaultUser),
                      radius: Get.width * 0.07),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
