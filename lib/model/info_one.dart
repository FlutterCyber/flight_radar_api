import 'package:flight_radar_api/model/all_info_model.dart';

class InfoOne {
  AllInfo data2;

  InfoOne.fromJson(Map<String, dynamic> json)
      : data2 = AllInfo.fromJson(json['rows']);
}
