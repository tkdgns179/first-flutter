import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'dart:convert';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'dto/MapInfo.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'util/apiKey.dart';

class MapTest extends StatelessWidget {

  late double lat;
  late double lng;

  MapTest({Key? key, required this.lat, required this.lng}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
        child: KakaoMapView(
          width: 300,
          height: 200,
          kakaoMapKey: jsApiKey,
          lat: lat,
          lng: lng,
          showMapTypeControl: true,
          showZoomControl: true,
          markerImageURL: 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
          onTapMarker: (message) {
            //event callback when the marker is tapped
          })
    );
  }
}




