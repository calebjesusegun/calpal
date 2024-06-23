import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/app_images.dart';
import '../../common/app_strings.dart';
import '../../common/app_text_styles.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/common/food_items/food_items.dart';
import '../../widgets/common/shimmer_loading_recommended_suggestions/shimmer_loading_recommended_suggestions.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
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
                SizedBox(
                  height: 16.h,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hello ${viewModel.username}',
                          style: AppTextStyles.titleRegularSize16.copyWith(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey01),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SvgPicture.asset(
                          AppImages.hiEmoji,
                          width: 20.h,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      AppText.ksRecommendedFood,
                      style: AppTextStyles.titleRegularSize16.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey03),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Builder(builder: (context) {
                  /// Error State
                  if (viewModel.hasError) {
                    return const SizedBox.shrink();
                  }

                  /// Response Data not yet ready
                  if (viewModel.fetchingRecommendedSuggestions) {
                    return const ShimmerLoadingRecommendedSuggestions();
                  }

                  // /// Response Data is Empty
                  // if (viewModel.fetchedRecommendedSuggestions == null ||
                  //     viewModel.fetchedRecommendedSuggestions!.isEmpty) {
                  //   return const SizedBox.shrink();
                  // }

                  /// Loaded Response
                  return SizedBox(
                    width: screenWidth(context).w,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          mainAxisExtent: 280.h,
                        ),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return FoodItems(
                            foodImageUrl: AppImages.foodImage,
                            foodName: 'Fried Rice',
                            foodDesc: 'This is a Fried Rice Food Category',
                            onTap: () => viewModel
                                .actionRouteToIndividualFoodSuggestionView(),
                          );
                        }),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(DashboardViewModel viewModel) {
    super.onViewModelReady(viewModel);
    // TODO: implement onViewModelReady
    viewModel.initialize();
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
