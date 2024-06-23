import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_images.dart';
import '../../../common/app_strings.dart';
import '../../../common/app_text_styles.dart';
import '../../../common/ui_helpers.dart';
import 'individual_food_suggestion_viewmodel.dart';

class IndividualFoodSuggestionView
    extends StackedView<IndividualFoodSuggestionViewModel> {
  const IndividualFoodSuggestionView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IndividualFoodSuggestionViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: (screenWidth(context).w),
                    child: Image.asset(
                      AppImages.foodImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, top: 20.0.h),
                    child: Material(
                      color: AppColors.transparent,
                      child: InkWell(
                        onTap: () => viewModel.actionRouteBack(),
                        child: SvgPicture.asset(
                          AppImages.backButton,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    left: sidePadding,
                    right: sidePadding,
                    top: sidePadding + 8.h,
                    bottom: sidePadding,
                  ),
                  color: AppColors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fried Rice',
                        style: AppTextStyles.titleRegularSize16.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey01),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'Ingredients',
                        style: AppTextStyles.titleRegularSize16.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey01),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        width: screenWidth(context).w,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              mainAxisExtent: 60.h,
                            ),
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8.w),
                                child: Container(
                                  // padding: EdgeInsets.only(
                                  //   left: sidePadding,
                                  //   right: sidePadding,
                                  //   top: sidePadding + 8.h,
                                  //   bottom: sidePadding,
                                  // ),
                                  color: AppColors.white01,
                                  child: Center(
                                    child: Text(
                                      'Instructions',
                                      style: AppTextStyles.titleRegularSize16
                                          .copyWith(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.grey01),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Instructions',
                        style: AppTextStyles.titleRegularSize16.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey01),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        'Wash tomatoes,pepper,ginger,garlic and one onion blend',
                        style: AppTextStyles.titleRegularSize16.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey01),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  IndividualFoodSuggestionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      IndividualFoodSuggestionViewModel();
}
