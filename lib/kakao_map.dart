import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const API_KEY = '6295f234fdb5fd684495673058299a19';

class MapTest extends StatelessWidget {
  String url = "";
  Set<JavascriptChannel>? channel;
  WebViewController? controller;

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: url,
      onWebViewCreated: (controller) {
        this.controller = controller;
      },
      javascriptChannels: channel,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

Future<http.Response> fetchMapInfo({required String keyword, required int lng, required int lat, int size = 10}) async {
  return http.get(
      Uri.parse("https://dapi.kakao.com/v2/local/search/keyword.json?query=$keyword&size=$size&x=$lng&y=&$lat"),
      headers: {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : 'KakaoAK $API_KEY}'
      });
}

class MapInfo {
  String address_name;
  String category_group_code;
  String category_group_name;
  String category_name;
  String distance;
  String id;
  String phone;
  String place_name;
  String place_url;
  String road_address_name;
  String x;
  String y;

  MapInfo(
    this.address_name,
    this.category_group_code,
    this.category_group_name,
    this.category_name,
    this.distance,
    this.id,
    this.phone,
    this.place_name,
    this.place_url,
    this.road_address_name,
    this.x,
    this.y,
  );

  factory MapInfo.fromJson(Map<String, dynamic> json){
    return MapInfo(
      json['address_name'] as String,
      json['category_group_code'] as String,
      json['category_group_name'] ,
      json['category_name'] as String,
      json['distance'] as String,
      json['id'] as String,
      json['phone'] as String,
      json['place_name'] as String,
      json['place_url'] as String,
      json['road_address_name'] as String,
      json['x'] as String,
      json['y'] as String
    );
  }


}
