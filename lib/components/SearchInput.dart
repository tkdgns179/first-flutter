import 'package:flutter/material.dart';
import 'package:my_flutter_app/dto/MapInfo.dart';
import '../kakao_map.dart' as kakaoMap;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '/util/apiKey.dart';



class SearchInput extends StatefulWidget {

  final Function searchedListHandler;
  SearchInput({Key? key, required this.searchedListHandler}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SearchInputState();
  }

}

class _SearchInputState extends State<SearchInput> {

  final _textController = TextEditingController();
  String? _searchText;
  List<MapInfo> _searchList = List<MapInfo>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _textController.addListener(setSearchText);
  }

  void setSearchText() {
    _searchText = _textController.text;
    widget.searchedListHandler(_searchText);
  }

  @override
  Widget build(BuildContext context) {

    // print("$_searchText");

    return Container(
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  controller: _textController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60)
                    ),
                    hintText: "검색할 내용을 입력",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                    ),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(15),
                      child: const Icon(Icons.search),
                      width: 14,
                    ),
                  ),
                ),
              )
            ,

            ],
          )
        ],
      )
    );
  }

}

Future<List<MapInfo>> fetchMapInfo({required String keyword, required double lng, required double lat, int size = 10}) async {
  var uri = "https://dapi.kakao.com/v2/local/search/keyword.json?query=$keyword&size=$size&x=$lng&y=$lat";
  print(uri);
  final response = await http.get(
      Uri.parse(uri),
      headers: {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : 'KakaoAK ${apiKey}'
      });

  print(response.statusCode);

  if (response.statusCode == 200) {
    // print('200 OK');
    // print(json.decode(response.body));
    List<dynamic> body =  json.decode(response.body)['documents'];
    List<MapInfo> mapInfoList = body.map((dynamic item) => MapInfo.fromJson(item)).toList();
    // print(mapInfoList[0].toString());
    return mapInfoList;
  }
  else {
    throw Exception("요청 실패");
  }
}
