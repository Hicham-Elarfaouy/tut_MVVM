import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app8/domain/models.dart';
import 'package:flutter_app8/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:flutter_app8/presentation/resources/assets_manager.dart';
import 'package:flutter_app8/presentation/resources/color_manager.dart';
import 'package:flutter_app8/presentation/resources/strings_manager.dart';
import 'package:flutter_app8/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OnBoardingSliderView>(
      stream: _viewModel.outputOnBoardingSliderView,
      builder: (context, snapshot) {
        OnBoardingSliderView? onBoardingSliderView = snapshot.data;
        if (onBoardingSliderView != null) {
          return Scaffold(
            backgroundColor: ColorManager.onBoardingScaffold,
            appBar: AppBar(
              backgroundColor: ColorManager.onBoardingScaffold,
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: ColorManager.white,
                statusBarBrightness: Brightness.dark,
              ),
            ),
            body: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              itemCount: onBoardingSliderView.numOfSlides,
              onPageChanged: (index) {
                _viewModel.onPageChange(index);
              },
              itemBuilder: (context, index) {
                return OnBoardingPage(onBoardingSliderView.onBoardingSlider);
              },
            ),
            bottomSheet: Container(
              color: ColorManager.onBoardingScaffold,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p8),
                        child: Text(
                          AppStrings.skip,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: ColorManager.primary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            _pageController.animateToPage(_viewModel.goBack(),
                                duration: const Duration(milliseconds: AppDuration.sliderDuration),
                                curve: Curves.fastOutSlowIn);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: ColorManager.white,
                          ),
                        ),
                        Row(
                          children: [
                            for (int i = 0;
                                i < onBoardingSliderView.numOfSlides;
                                i++)
                              Padding(
                                padding: const EdgeInsets.all(AppPadding.p8),
                                child: _getProperCircle(
                                    i, onBoardingSliderView.currentIndex),
                              )
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            _pageController.animateToPage(_viewModel.goForward(),
                                duration: const Duration(milliseconds: AppDuration.sliderDuration),
                                curve: Curves.fastOutSlowIn);
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorManager.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (currentIndex == index) {
      return SvgPicture.asset(AppImages.hollowCircle);
    } else {
      return SvgPicture.asset(AppImages.solidCircle);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final OnBoardingSlider _onBoardingSlider;

  const OnBoardingPage(this._onBoardingSlider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            _onBoardingSlider.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: AppSize.onBoardingS20,
          ),
          Text(
            _onBoardingSlider.subTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppSize.onBoardingS60,
          ),
          SvgPicture.asset(_onBoardingSlider.image),
        ],
      ),
    );
  }
}
