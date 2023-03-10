class MapInfo {
  final String address_name;
  final String category_group_code;
  final String category_group_name;
  final String category_name;
  final String distance;
  final String id;
  final String phone;
  final String place_name;
  final String place_url;
  final String road_address_name;
  final String x;
  final String y;

  MapInfo({
    required this.address_name,
    required this.category_group_code,
    required this.category_group_name,
    required this.category_name,
    required this.distance,
    required this.id,
    required this.phone,
    required this.place_name,
    required this.place_url,
    required this.road_address_name,
    required this.x,
    required this.y,
  });

  factory MapInfo.fromJson(Map<String, dynamic> json){
    return MapInfo(
      address_name : json['address_name'],
      category_group_code : json['category_group_code'],
      category_group_name : json['category_group_name'],
      category_name : json['category_name'],
      distance : json['distance'],
      id : json['id'],
      phone : json['phone'],
      place_name : json['place_name'],
      place_url : json['place_url'],
      road_address_name : json['road_address_name'],
      x : json['x'],
      y : json['y'],
    );
  }

  @override
  String toString() {
    return 'MapInfo{address_name: $address_name, category_group_code: $category_group_code, category_group_name: $category_group_name, category_name: $category_name, distance: $distance, id: $id, phone: $phone, place_name: $place_name, place_url: $place_url, road_address_name: $road_address_name, x: $x, y: $y}';
  }


}