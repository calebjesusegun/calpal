import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/app_colors.dart';
import '../../../../common/app_images.dart';
import '../../../../common/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.assetName,
    required this.categoryName,
    required this.isCategorySelected,
    required this.onTap,
    super.key,
  });

  final String categoryName;
  final String assetName;
  final bool isCategorySelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 170.h,
        decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: InkWell(
          onTap: onTap,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    assetName,
                    width: 96.w,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    categoryName,
                    style: AppTextStyles.titleRegularSize16.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey01),
                  ),
                ],
              ),
              if (isCategorySelected == true) ...[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: AppColors.primary01,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.w),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.check,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
