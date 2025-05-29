class ApparelResponseModel {
  ApparelResponseModel({
    required this.data,
  });

  final Data? data;

  factory ApparelResponseModel.fromJson(Map<String, dynamic> json) {
    return ApparelResponseModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.outerwear,
    required this.denim,
    required this.tops,
    required this.bottoms,
    required this.dresses,
    required this.accessories,
    required this.footwear,
  });

  final int? outerwear;
  final int? denim;
  final int? tops;
  final int? bottoms;
  final int? dresses;
  final int? accessories;
  final int? footwear;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      outerwear: json["outerwear"],
      denim: json["denim"],
      tops: json["tops"],
      bottoms: json["bottoms"],
      dresses: json["dresses"],
      accessories: json["accessories"],
      footwear: json["footwear"],
    );
  }

  Map<String, dynamic> toJson() => {
        "outerwear": outerwear,
        "denim": denim,
        "tops": tops,
        "bottoms": bottoms,
        "dresses": dresses,
        "accessories": accessories,
        "footwear": footwear,
      };
}
