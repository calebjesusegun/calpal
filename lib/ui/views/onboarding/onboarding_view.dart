import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../../common/app_images.dart';
import '../../common/app_strings.dart';
import '../../common/app_text_styles.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/common/primary_button/primary_button.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.appLogo,
                    width: 80.w,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                SvgPicture.asset(
                  AppImages.onboarding,
                  width: 250.w,
                ),
                SizedBox(
                  height: 34.h,
                ),
                Text(
                  AppText.ksCookingCompanion,
                  style: AppTextStyles.titleRegularSize16.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey01),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  AppText.ksCalpalRecommends,
                  style: AppTextStyles.titleRegularSize16.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey02),
                  textAlign: TextAlign.center,
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
        // color: Colors.red,
        child: PrimaryButton(
          buttonText: AppText.ksGetStarted,
          onTap: () => viewModel.actionRouteToOnboardingUsername(),
          isDisabled: false,
          loadingStateStatus: false,
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}
