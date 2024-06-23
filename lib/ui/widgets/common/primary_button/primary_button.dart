import 'package:calpal/ui/widgets/common/primary_button/primary_button_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_images.dart';
import '../../../common/app_text_styles.dart';
import '../../../common/ui_helpers.dart';

class PrimaryButton extends StackedView<PrimaryButtonModel> {
  PrimaryButton(
      {Key? key,
      required this.buttonText,
      required this.onTap,
      required this.isDisabled,
      required this.loadingStateStatus,
      this.color,
      this.textColor,
      this.height,
      this.width,
      this.borderRadius,
      this.elevation,
      this.icon,
      this.prefixIcon,
      this.fontSize,
      this.fontWeight})
      : super(key: key);

  final String buttonText;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? elevation;
  final Color? color;
  bool? prefixIcon = false;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final bool loadingStateStatus;
  bool? icon = false;
  bool isDisabled = false;

  @override
  Widget builder(
    BuildContext context,
    PrimaryButtonModel viewModel,
    Widget? child,
  ) {
    return Container(
      height: height ?? 56.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 32.0.r),
        color: isDisabled ? AppColors.primary02 : AppColors.primary01,
      ),
      child: Material(
        elevation: elevation ?? 1,
        color: color ?? Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius ?? 32.0.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
          onTap: isDisabled ? null : onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: AppTextStyles.titleRegularSize16.copyWith(
                  color: textColor ?? AppColors.white,
                  letterSpacing: 0.8,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  fontSize: fontSize ?? 16.sp,
                ),
              ),
              horizontalSpaceTiny,
              if (loadingStateStatus) ...[
                SizedBox(
                  width: 25.w,
                  child: Lottie.asset(AppImages.buttonLoadingWhiteState),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  PrimaryButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      PrimaryButtonModel();
}
