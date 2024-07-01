import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_images.dart';
import '../../../common/app_strings.dart';
import '../../../common/app_text_styles.dart';
import '../../../common/ui_helpers.dart';
import '../../../utilities/validation.dart';
import '../../../widgets/common/custom_text_field/custom_text_field.dart';
import '../../../widgets/common/primary_button/primary_button.dart';
import 'onboarding_username_view.form.dart';
import 'onboarding_username_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'username'),
])
class OnboardingUsernameView extends StackedView<OnboardingUsernameViewModel>
    with $OnboardingUsernameView {
  const OnboardingUsernameView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingUsernameViewModel viewModel,
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
                  AppText.ksUsername,
                  style: AppTextStyles.titleRegularSize16.copyWith(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey01),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  AppText.ksPreferredName,
                  style: AppTextStyles.titleRegularSize16.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey03),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  label: AppText.ksUsername,
                  validator: (val) =>
                      Validation.validateField(AppText.ksUsernameRequired),
                  hintText: AppText.ksUsername,
                  textInputAction: TextInputAction.next,
                  controller: usernameController,
                  focusNode: usernameFocusNode,
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
          onTap: () => viewModel
              .actionRouteToOnboardingCategory(usernameController.text),
          isDisabled: usernameController.text.isEmpty,
          loadingStateStatus: false,
        ),
      ),
    );
  }

  @override
  void onViewModelReady(OnboardingUsernameViewModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
    // TODO: implement onViewModelReady
  }

  @override
  void onDispose(OnboardingUsernameViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  OnboardingUsernameViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingUsernameViewModel();
}
