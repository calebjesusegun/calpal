

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:overlay_support/overlay_support.dart';

import '../ui/common/app_colors.dart';

class UtilsService {
  /// Function to initialize busy ui parameters
  void configLoading() {
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorSize = 30.0
      ..radius = 10.0
      ..backgroundColor = AppColors.primary01.withOpacity(0.5)
      ..indicatorColor = AppColors.white
      ..textColor = Colors.black
      ..maskColor = AppColors.primary01.withOpacity(0.2)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  void errorMsgNotification({required String text}) {
    showSimpleNotification(
      Text(
        text,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
        ),
      ),
      trailing: Builder(builder: (context) {
        return TextButton(
          onPressed: () {
            OverlaySupportEntry.of(context)?.dismiss();
          },
          child: const Text(
            'Dismiss',
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
        );
      }),
      background: Colors.red,
      autoDismiss: true,
      slideDismissDirection: DismissDirection.up,
      duration: const Duration(hours: 0, minutes: 0, seconds: 5),
    );
  }

  void successMsgNotification({required String text}) {
    showSimpleNotification(
      Text(
        text,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
        ),
      ),
      trailing: Builder(builder: (context) {
        return TextButton(
          onPressed: () {
            OverlaySupportEntry.of(context)?.dismiss();
          },
          child: const Text(
            'Dismiss',
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
        );
      }),
      background: Colors.green,
      autoDismiss: true,
      slideDismissDirection: DismissDirection.up,
      duration: const Duration(hours: 0, minutes: 0, seconds: 5),
    );
  }
}
