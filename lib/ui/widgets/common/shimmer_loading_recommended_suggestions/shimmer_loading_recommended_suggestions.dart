import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import '../../../common/ui_helpers.dart';
import 'shimmer_loading_recommended_suggestions_model.dart';

class ShimmerLoadingRecommendedSuggestions
    extends StackedView<ShimmerLoadingRecommendedSuggestionsModel> {
  const ShimmerLoadingRecommendedSuggestions({super.key});

  @override
  Widget builder(
    BuildContext context,
    ShimmerLoadingRecommendedSuggestionsModel viewModel,
    Widget? child,
  ) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          mainAxisExtent: 240.h,
        ),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: (Colors.grey[300])!,
                highlightColor: (Colors.grey[100])!,
                enabled: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0.r),
                  child: Container(
                    height: 200.h,
                    width: (screenWidth(context).w / 2) - (sidePadding + 8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Shimmer.fromColors(
                baseColor: (Colors.grey[300])!,
                highlightColor: (Colors.grey[100])!,
                enabled: true,
                child: Container(
                  width: screenHeight(context) - (sidePadding * 2),
                  height: screenHeight(context) * .01,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Shimmer.fromColors(
                baseColor: (Colors.grey[300])!,
                highlightColor: (Colors.grey[100])!,
                enabled: true,
                child: Container(
                  width: screenHeight(context) - (sidePadding * 2),
                  height: screenHeight(context) * .01,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  ShimmerLoadingRecommendedSuggestionsModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShimmerLoadingRecommendedSuggestionsModel();
}
