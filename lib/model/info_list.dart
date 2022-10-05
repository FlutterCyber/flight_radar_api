import 'package:flight_radar_api/model/all_info_model.dart';

class InfoList {
  var version;
  List<AllInfo> rows;

  InfoList.fromJson(Map<String, dynamic> json)
      : version = json['version'],
        rows =  List<AllInfo>.from(json['rows'].map((x) => AllInfo.fromJson(x)));
}


