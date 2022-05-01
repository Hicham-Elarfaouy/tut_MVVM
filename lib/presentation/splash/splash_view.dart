import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app8/presentation/resources/assets_manager.dart';
import 'package:flutter_app8/presentation/resources/color_manager.dart';
import 'package:flutter_app8/presentation/resources/routes_manager.dart';
import 'package:flutter_app8/presentation/resources/values_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppDuration.splashDuration),_goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Center(
          child: Image(
            image: AssetImage(AppImages.splashLogo),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
