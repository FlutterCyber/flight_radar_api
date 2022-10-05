import 'package:flight_radar_api/model/timezone_model.dart';
class AllInfo {
  var id;
  var name;
  var iata;
  var icao;
  var city;
  var lat;
  var lon;
  var country;
  var alt;
  var size;
  TimeZone timezone;
  var countryId;

  AllInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        iata = json['iata'],
        icao = json['icao'],
        city = json['city'],
        lat = json['lat'],
        lon = json['lon'],
        country = json['country'],
        alt = json['alt'],
        size = json['size'],
        timezone = TimeZone.fromJson(json["timezone"]),
        countryId = json['countryId'];
}
