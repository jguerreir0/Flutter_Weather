// To parse this JSON data, do
//
//     final cityResponseModel = cityResponseModelFromJson(jsonString);

import 'dart:convert';

List<CityResponseModel> cityResponseModelFromJson(String str) =>
    List<CityResponseModel>.from(
        json.decode(str).map((x) => CityResponseModel.fromJson(x)));

String cityResponseModelToJson(List<CityResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityResponseModel {
  CityResponseModel({
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
  });

  String title;
  String locationType;
  int woeid;
  String lattLong;

  factory CityResponseModel.fromJson(Map<String, dynamic> json) =>
      CityResponseModel(
        title: json["title"],
        locationType: json["location_type"],
        woeid: json["woeid"],
        lattLong: json["latt_long"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "location_type": locationType,
        "woeid": woeid,
        "latt_long": lattLong,
      };
}
