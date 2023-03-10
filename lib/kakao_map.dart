import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'dart:convert';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'dto/MapInfo.dart';

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


