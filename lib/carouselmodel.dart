// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Carouselmodel> carouselFromJson(String str) => List<Carouselmodel>.from(json.decode(str).map((x) => Carouselmodel.fromJson(x)));

String carouselToJson(List<Carouselmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Carouselmodel {
    Carouselmodel({
      required  this.bannerId,
      required  this.banner,
    });

    String bannerId;
    String banner;

    factory Carouselmodel.fromJson(Map<String, dynamic> json) => Carouselmodel(
        bannerId: json["banner_id"],
        banner: json["banner"],
    );

    Map<String, dynamic> toJson() => {
        "banner_id": bannerId,
        "banner": banner,
    };
}
