import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import 'explore_viewmodel.dart';

class ExploreView extends StackedView<ExploreViewModel> {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ExploreViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ExploreViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExploreViewModel();
}
