import 'dart:async';

import 'package:flutter_app8/domain/models.dart';
import 'package:flutter_app8/presentation/base/base_viewmodel.dart';
import 'package:flutter_app8/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs,OnBoardingViewModelOutputs{

  final StreamController _streamController = StreamController<OnBoardingSliderView>();
  late final List<OnBoardingSlider> _list;
  int _currentIndex = 0;

  @override
  start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  dispose() {
    _streamController.close();
  }

  @override
  int goForward() {
    int forwardIndex = ++_currentIndex;
    if(forwardIndex == _list.length){
      forwardIndex = 0;
    }
    return forwardIndex;
  }

  @override
  int goBack() {
    int backIndex = --_currentIndex;
    if(backIndex == -1){
      backIndex = _list.length - 1;
    }
    return backIndex;
  }

  @override
  onPageChange(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputOnBoardingSliderView => _streamController.sink;

  @override
  Stream<OnBoardingSliderView> get outputOnBoardingSliderView => _streamController.stream.map((OnBoardingSliderView) => OnBoardingSliderView);


  /*private functions*/
  _postDataToView(){
    inputOnBoardingSliderView.add(OnBoardingSliderView(_list[_currentIndex],_list.length,_currentIndex));
  }

  List<OnBoardingSlider> _getSliderData() => [
    for(int i=0 ; i<4 ; i++)
      OnBoardingSlider(AppStrings.listOnBoardingTitle[i], AppStrings.listOnBoardingSubTitle[i], AppStrings.listOnBoardingImage[i]),
  ];
}




abstract class OnBoardingViewModelInputs{
  int goForward();
  int goBack();
  onPageChange(int index);

  /*Stream*/
  Sink get inputOnBoardingSliderView;
}

abstract class OnBoardingViewModelOutputs{
  Stream<OnBoardingSliderView> get outputOnBoardingSliderView;
}



class OnBoardingSliderView{
  OnBoardingSlider onBoardingSlider;
  int numOfSlides;
  int currentIndex;

  OnBoardingSliderView(this.onBoardingSlider,this.numOfSlides,this.currentIndex);
}