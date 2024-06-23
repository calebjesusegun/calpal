import 'package:calpal/ui/common/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../common/app_colors.dart';
import '../../../common/ui_helpers.dart';
import 'food_items_model.dart';

class FoodItems extends StackedView<FoodItemsModel> {
  FoodItems({
    super.key,
    required this.foodImageUrl,
    required this.foodName,
    required this.foodDesc,
    required this.onTap,
  });

  String foodImageUrl;
  String foodName;
  String foodDesc;
  VoidCallback onTap;

  @override
  Widget builder(
    BuildContext context,
    FoodItemsModel viewModel,
    Widget? child,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // InkWell(
        //   onTap: onTap,
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(20.0.r),
        //     child: CachedNetworkImage(
        //       imageUrl: productUrl,
        //       height: 200.h,
        //       width: (screenWidth(context).w / 2) - ((sidePadding * 2) + 8.w),
        //       fit: BoxFit.fill,
        //       placeholder: (context, url) => Shimmer.fromColors(
        //         baseColor: (Colors.grey[300])!,
        //         highlightColor: (Colors.grey[100])!,
        //         enabled: true,
        //         child: Container(
        //           height: 200.h,
        //           width: (screenWidth(context).w / 2) - ((sidePadding * 2) + 8.w),
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20.r),
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //       errorWidget: (context, url, error) => Container(
        //         height: 200.h,
        //         width: (screenWidth(context).w / 2) - ((sidePadding * 2) + 8.w),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(20.r),
        //           color: AppColors.grey03.withOpacity(0.5),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        InkWell(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0.r),
            child: SizedBox(
              height: 200.h,
              width: (screenWidth(context).w / 2) - (sidePadding + 8.w),
              child: Image.asset(
                foodImageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          foodName,
          style: AppTextStyles.titleRegularSize16.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
              color: AppColors.grey01),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          foodDesc,
          style: AppTextStyles.titleRegularSize16
              .copyWith(fontSize: 13.sp, color: AppColors.grey01),
        ),
      ],
    );
  }

  @override
  FoodItemsModel viewModelBuilder(
    BuildContext context,
  ) =>
      FoodItemsModel();
}
