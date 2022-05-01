import 'package:flutter_app8/presentation/resources/assets_manager.dart';

class AppStrings {
  static const String noRouteFound = 'No Route Found';

  /*OnBoarding View*/
  static const String skip = 'SKIP';
  static List<String> listOnBoardingTitle = [
    'see the best course #1'.toUpperCase(),
    'see the best course #2'.toUpperCase(),
    'see the best course #3'.toUpperCase(),
    'see the best course #4'.toUpperCase(),
  ];
  static const List<String> listOnBoardingSubTitle = [
    'Tut app is an awesome flutter application using clean architecture #1',
    'Tut app is an awesome flutter application using clean architecture #2',
    'Tut app is an awesome flutter application using clean architecture #3',
    'Tut app is an awesome flutter application using clean architecture #4',
  ];
  static const List<String> listOnBoardingImage = [
    AppImages.onBoardingImage1,
    AppImages.onBoardingImage2,
    AppImages.onBoardingImage3,
    AppImages.onBoardingImage4,
  ];
}