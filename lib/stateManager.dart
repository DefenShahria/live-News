import 'dart:developer';

import 'package:get/get.dart';

import 'model.dart';
import 'network/networkCaller.dart';
import 'network/networkResponse.dart';

class NewsController extends GetxController{
  bool _getNewsInprogess = false;
  bool _getNewsInprogess2 = false;

  String _message ='';

  NewsModel _newsData = NewsModel();

  bool get getNewsInprogess => _getNewsInprogess;
  bool get getNewsInprogess2 => _getNewsInprogess2;

  String get message => _message;
  NewsModel get newsData => _newsData;

  Future<bool>getNewsBychannel(String newsChannel)async{
    _getNewsInprogess= true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequestByChannel(newsChannel);
    _getNewsInprogess =false;
    update();
    log(newsData.articles.toString());
    if(response.isSucess){
      _newsData = NewsModel.fromJson(response.body!);
      update();
      return true;
    }else{
      _message = 'Failed';
      return false;
    }
  }
  Future<bool>getNewsBycategory(String category)async{
    _getNewsInprogess2= true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequestByChategory(category);
    _getNewsInprogess2 =false;
    update();
    log(newsData.articles.toString());
    if(response.isSucess){
      _newsData = NewsModel.fromJson(response.body!);
      update();
      return true;
    }else{
      _message = 'Failed';
      return false;
    }
  }

}