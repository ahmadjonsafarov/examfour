class AddressModel{
  final num? lat;
  final num? long;
  final String? title;
  AddressModel({required this.lat, required this.long, required this.title, });

  factory  AddressModel.fromJson(Map data){
    return AddressModel(lat: data['lat'], long: data["long"], title: data["title"]);
  }

  toJson(){
    return{
      "long":long,
      'lat':lat,
      'title':title,
    };
  }
}