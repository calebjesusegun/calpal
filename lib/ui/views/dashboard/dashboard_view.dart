import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../../common/app_images.dart';
import '../../common/app_strings.dart';
import '../../common/app_text_styles.dart';
import '../../common/ui_helpers.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView(
      {required this.foodDetailsResponse, required this.file, Key? key})
      : super(key: key);

  final File file;
  final Map foodDetailsResponse;

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    final dashboardScaffoldKey = GlobalKey<ScaffoldState>();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: dashboardScaffoldKey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary01,
        shape: const CircleBorder(),
        onPressed: () => viewModel.actionRouteToOnboardingCategory(),
        child: const Icon(
          Icons.add,
          color: AppColors.white,
          size: 36,
        ),
      ),
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
                          '${AppText.ksHello} ${viewModel.username}',
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(6.r),
                  child: Image.file(
                    file,
                    fit: BoxFit.cover,
                    width: size.width.w,
                    height: 300.h,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  foodDetailsResponse["foodName"],
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
                      itemCount: foodDetailsResponse["ingredients"].length,
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.w),
                          child: Container(
                            padding: EdgeInsets.all(4.w),
                            color: AppColors.white01,
                            child: Center(
                              child: Text(
                                foodDetailsResponse["ingredients"][index],
                                style: AppTextStyles.titleRegularSize16
                                    .copyWith(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey01),
                                textAlign: TextAlign.center,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      foodDetailsResponse["instructions"].length, (index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '* ${foodDetailsResponse["instructions"][index]}',
                          style: AppTextStyles.titleRegularSize16.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey01),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                      ],
                    );
                  }),
                ),
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
