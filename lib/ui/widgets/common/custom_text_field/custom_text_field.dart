import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_text_styles.dart';
import 'custom_text_field_model.dart';

class CustomTextField extends StackedView<CustomTextFieldModel> {
  CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.validator,
    this.onChanged,
    this.autofillHints,
    this.isReadOnly,
    this.isLabelRequired = true,
    this.keyBoardType,
    this.textInputAction,
    this.showVisibilityToggle = false,
    this.controller,
    this.focusNode,
    this.onTap,
    this.onFieldSubmitted,
    this.prefix,
    this.isRequired = true,
    this.inputFormatters,
  });
  final String label;
  final String hintText;
  final Widget? prefix;
  final Iterable<String>? autofillHints;
  final Function(String)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool? isReadOnly;
  final TextInputAction? textInputAction;
  final TextInputType? keyBoardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  bool showVisibilityToggle;
  bool isRequired;
  bool isLabelRequired;
  List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;

  @override
  Widget builder(
    BuildContext context,
    CustomTextFieldModel viewModel,
    Widget? child,
  ) {
    return TextFormField(
        style: AppTextStyles.titleRegularSize16.copyWith(
            color: AppColors.grey01,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        controller: controller ?? TextEditingController(),
        focusNode: focusNode ?? FocusNode(),
        autofillHints: autofillHints,
        textInputAction: textInputAction,
        cursorColor: AppColors.primary01,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          fillColor: AppColors.textFieldColor,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0.r),
            ),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0.r),
            ),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0.r),
            ),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: AppTextStyles.titleRegularSize16
              .copyWith(fontSize: 15, color: AppColors.grey03),
          prefix: prefix,
        ),
        validator: validator,
        onChanged: onChanged,
        onTap: onTap,
        readOnly: isReadOnly ?? false,
        keyboardType: keyBoardType ?? TextInputType.text,
        inputFormatters: inputFormatters);
  }

  @override
  CustomTextFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomTextFieldModel();
}
