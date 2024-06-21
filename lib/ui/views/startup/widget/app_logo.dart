import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/app_images.dart';

class AppLogoWidget extends StatefulWidget {
  const AppLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AppLogoWidget> createState() {
    return _AppLogoWidgetState();
  }
}

class _AppLogoWidgetState extends State<AppLogoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    /// Start the animation after a delay
    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Image.asset(
        AppImages.appLogo,
        width: 200.w,
      ),
    );
  }
}
