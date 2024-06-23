import 'package:calpal/ui/views/onboarding/onboarding_category/widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_images.dart';
import '../../../common/app_strings.dart';
import '../../../common/app_text_styles.dart';
import '../../../common/ui_helpers.dart';
import '../../../widgets/common/primary_button/primary_button.dart';
import 'onboarding_category_viewmodel.dart';

class OnboardingCategoryView extends StackedView<OnboardingCategoryViewModel> {
  const OnboardingCategoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingCategoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sidePadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.appLogo,
                    width: 80.w,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  AppText.ksCategory,
                  style: AppTextStyles.titleRegularSize16.copyWith(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey01),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  AppText.ksChooseCategory,
                  style: AppTextStyles.titleRegularSize16.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey03),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    CategoryItem(
                      isCategorySelected: (viewModel.selectedIndex == 0),
                      categoryName: AppText.ksCarbohydrates,
                      assetName: AppImages.carbonhydrate,
                      onTap: () => viewModel.updateSelectedIndex(0),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    CategoryItem(
                      isCategorySelected: (viewModel.selectedIndex == 1),
                      categoryName: AppText.ksProtein,
                      assetName: AppImages.protein,
                      onTap: () => viewModel.updateSelectedIndex(1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    CategoryItem(
                      isCategorySelected: (viewModel.selectedIndex == 2),
                      categoryName: AppText.ksFats,
                      assetName: AppImages.fats,
                      onTap: () => viewModel.updateSelectedIndex(2),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    CategoryItem(
                      isCategorySelected: (viewModel.selectedIndex == 3),
                      categoryName: AppText.ksFruits,
                      assetName: AppImages.fruits,
                      onTap: () => viewModel.updateSelectedIndex(3),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: sidePadding,
          vertical: 36.h,
        ),
        child: PrimaryButton(
          buttonText: AppText.ksProceed,
          onTap: () => {},
          isDisabled: viewModel.getDisabledState(),
          loadingStateStatus: false,
        ),
      ),
    );
  }

  @override
  OnboardingCategoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingCategoryViewModel();
}
