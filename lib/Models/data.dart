import 'dart:convert';

Ggdata ggdataFromJson(String str) => Ggdata.fromJson(json.decode(str));

String ggdataToJson(Ggdata data) => json.encode(data.toJson());

class Ggdata {
  bool statusCode;
  String message;
  List<Datum> data;

  Ggdata({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory Ggdata.fromJson(Map<String, dynamic> json) => Ggdata(
        statusCode: json["status_code"],
        message: json["message"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String url;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Datum({
    required this.id,
    required this.url,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        url: json["url"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "url": url,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
