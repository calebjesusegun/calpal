import 'package:calpal/ui/common/app_text_styles.dart';
import 'package:calpal/ui/views/explore/explore_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../../common/app_images.dart';
import '../../common/app_strings.dart';
import '../dashboard/dashboard_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
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
      body: getViewForIndex(viewModel.currentIndex),
      bottomNavigationBar: Container(
        height: size.height.h * 0.116,
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(color: AppColors.grey03, width: 0.35),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 5,
          selectedItemColor: AppColors.primary01,
          unselectedItemColor: AppColors.grey03,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          currentIndex: viewModel.currentIndex,
          selectedLabelStyle: AppTextStyles.titleRegularSize16.copyWith(
              color: AppColors.primary01,
              fontWeight: FontWeight.w500,
              fontSize: 13.sp),
          unselectedLabelStyle: AppTextStyles.titleRegularSize16.copyWith(
              fontSize: 13.sp,
              color: AppColors.grey02,
              fontWeight: FontWeight.w500),
          onTap: viewModel.setIndex,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.homeInActive,
                // color: AppColors.grey03,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.homeActive,
                // color: AppColors.primary01,
              ),
              label: AppText.ksHome,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.exploreInActive,
                // color: AppColors.grey03,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.exploreActive,
                // color: AppColors.primary01,
              ),
              label: AppText.ksExplore,
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

Widget getViewForIndex(int index) {
  switch (index) {
    case 0:
      return const DashboardView();
    case 1:
      return const ExploreView();
    default:
      return const DashboardView();
  }
}
