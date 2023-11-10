import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import 'networkResponse.dart';

class NetworkCaller {


  static Future<NetworkResponse> getRequestByChategory(String category) async {
    String newsUrl = 'https://newsapi.org/v2/everything?q=$category&apiKey=516b075aac294ca1a8067d805dc7dab0';

    try {
      Response response = await get(Uri.parse(newsUrl));
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }
  static Future<NetworkResponse> getRequestByChannel(String newsChannel) async {
    String newsUrl2 = 'https://newsapi.org/v2/top-headlines?sources=${newsChannel}&apiKey=516b075aac294ca1a8067d805dc7dab0';

    try {
      Response response = await get(Uri.parse(newsUrl2));
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }
}