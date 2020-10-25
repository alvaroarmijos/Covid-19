import 'dart:convert';

Covid covidFromJson(String str) => Covid.fromJson(json.decode(str));

String covidToJson(Covid data) => json.encode(data.toJson());

class Covid {
  String id;
  String fecha;
  int confirmados;
  int muertes;
  int recuperados;

  Covid({
    this.id,
    this.confirmados = 0,
    this.muertes = 0,
    this.recuperados = 0,
    this.fecha = ""
  });

  factory Covid.fromJson(Map<String, dynamic> json) => Covid(
    id            : json["id"],
    fecha         : json["fecha"],
    confirmados   : json["confirmados"],
    muertes       : json["muertes"],
    recuperados   : json["recuperados"],
  );

  Map<String, dynamic> toJson() => {
    "id"           : id,
    "fecha"        : fecha,
    "confirmados"  : confirmados,
    "muertes"      : muertes,
    "recuperados"  : recuperados,
  };
}