// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String UsernameValueKey = 'username';

final Map<String, TextEditingController>
    _OnboardingUsernameViewTextEditingControllers = {};

final Map<String, FocusNode> _OnboardingUsernameViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _OnboardingUsernameViewTextValidations = {
  UsernameValueKey: null,
};

mixin $OnboardingUsernameView {
  TextEditingController get usernameController =>
      _getFormTextEditingController(UsernameValueKey);

  FocusNode get usernameFocusNode => _getFormFocusNode(UsernameValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_OnboardingUsernameViewTextEditingControllers.containsKey(key)) {
      return _OnboardingUsernameViewTextEditingControllers[key]!;
    }

    _OnboardingUsernameViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _OnboardingUsernameViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_OnboardingUsernameViewFocusNodes.containsKey(key)) {
      return _OnboardingUsernameViewFocusNodes[key]!;
    }
    _OnboardingUsernameViewFocusNodes[key] = FocusNode();
    return _OnboardingUsernameViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    usernameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    usernameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          UsernameValueKey: usernameController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _OnboardingUsernameViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _OnboardingUsernameViewFocusNodes.values) {
      focusNode.dispose();
    }

    _OnboardingUsernameViewTextEditingControllers.clear();
    _OnboardingUsernameViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get usernameValue => this.formValueMap[UsernameValueKey] as String?;

  set usernameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({UsernameValueKey: value}),
    );

    if (_OnboardingUsernameViewTextEditingControllers.containsKey(
        UsernameValueKey)) {
      _OnboardingUsernameViewTextEditingControllers[UsernameValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasUsername =>
      this.formValueMap.containsKey(UsernameValueKey) &&
      (usernameValue?.isNotEmpty ?? false);

  bool get hasUsernameValidationMessage =>
      this.fieldsValidationMessages[UsernameValueKey]?.isNotEmpty ?? false;

  String? get usernameValidationMessage =>
      this.fieldsValidationMessages[UsernameValueKey];
}

extension Methods on FormStateHelper {
  setUsernameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UsernameValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    usernameValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      UsernameValueKey: getValidationMessage(UsernameValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _OnboardingUsernameViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _OnboardingUsernameViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      UsernameValueKey: getValidationMessage(UsernameValueKey),
    });
