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
    final Size size = MediaQuery.of(context).size;
    return AbsorbPointer(
      absorbing: viewModel.loadingStateStatus,
      child: Scaffold(
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
                    height: 10.h,
                  ),
                  Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      onTap: () => viewModel.actionRouteBack(),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset(
                          AppImages.backButton,
                        ),
                      ),
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
                  Builder(builder: (context) {
                    if (viewModel.selectedMedia.isEmpty) {
                      return Material(
                        color: AppColors.transparent,
                        child: InkWell(
                          onTap: () => viewModel.pickFiles(),
                          child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              AppImages.uploadImage,
                              fit: BoxFit.fill,
                              width: size.width.w,
                              height: 220.h,
                            ),
                          ),
                        ),
                      );
                    }
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: Image.file(
                        viewModel.file,
                        fit: BoxFit.cover,
                        width: size.width.w,
                        height: 300.h,
                      ),
                    );
                  }),
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
            onTap: () => viewModel.getFoodDetails(),
            isDisabled: viewModel.getDisabledState(),
            loadingStateStatus: viewModel.loadingStateStatus,
          ),
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
