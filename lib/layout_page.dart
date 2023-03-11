import 'package:flutter/material.dart';
import 'package:my_flutter_app/dto/MapInfo.dart';
import 'package:my_flutter_app/main.dart';
import 'kakao_map.dart';
import 'components/SearchInput.dart';

class LayoutPage extends StatefulWidget {

  LayoutPage({Key? key}) : super(key: key);

  @override
  State<LayoutPage> createState() {
    return _LayoutPageState();
  }
}

class _LayoutPageState extends State<LayoutPage> {

  List<MapInfo> _searchList = List<MapInfo>.empty(growable: true);
  late double _lat;
  late double _lng;
  bool _isClicked = false;

  void fetchSearchedList(String searchText) async {
    List<MapInfo> list = await fetchMapInfo(keyword: searchText, lng: 37.51, lat: 126.94);
    setState(() {
      _searchList = list;
    });
  }

  void setLocation(double lat, double lng, Function stateHandler) {
    stateHandler(lat, lng);
  }

  @override
  Widget build(BuildContext context) {

    // if (_searchList.length > 0) {
    //   print(_searchList[0].toString());
    // }

    print(_searchList.length);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SearchInput(searchedListHandler: fetchSearchedList),
              Container(
                height: 200,
                child: _searchList.isNotEmpty ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _searchList.length,
                  itemBuilder: (BuildContext context, int idx) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            _isClicked = true;
                            _lng = double.parse(_searchList[idx].x);
                            _lat = double.parse(_searchList[idx].y);
                            print("lat : $_lat, lng : $_lng");
                          });
                        },
                        child : Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                              )
                          ),
                          child: Column(
                            children: [
                              Text("주소 : ${_searchList[idx].address_name}"),
                              Text("가게이름 : ${_searchList[idx].place_name}"),
                              Text("전화번호 : ${_searchList[idx].phone}"),],
                          ),
                        )
                    );

                })
                : Text("Empty"),
              ),
              _isClicked ? MapTest(lat: _lat, lng: _lng) : Text("Empty")

            ],
          )),
    );
  }

}
