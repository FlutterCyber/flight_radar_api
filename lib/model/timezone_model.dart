class TimeZone {
  var name;
  var offset;
  var offsetHours;
  var abbr;
  var abbrName;
  var isDst;

  TimeZone.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        offset = json['offset'],
        offsetHours = json['offsetHours'],
        abbr = json['abbr'],
        abbrName = json['abbrName'],
        isDst = json['isDst'];
}
