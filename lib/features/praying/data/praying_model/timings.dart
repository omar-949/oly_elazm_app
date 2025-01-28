import 'package:easy_localization/easy_localization.dart';

class PrayerTimingsResponse {
  int? code;
  String? status;
  List<PrayerData>? data;

  PrayerTimingsResponse({this.code, this.status, this.data});

  factory PrayerTimingsResponse.fromJson(Map<String, dynamic> json) {
    return PrayerTimingsResponse(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: (json['data'] as List?)
          ?.map((item) => PrayerData.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'status': status,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class PrayerData {
  Timings? timings;
  PrayerDate? date;
  PrayerMeta? meta;

  PrayerData({this.timings, this.date, this.meta});

  factory PrayerData.fromJson(Map<String, dynamic> json) {
    return PrayerData(
      timings:
          json['timings'] != null ? Timings.fromJson(json['timings']) : null,
      date: json['date'] != null ? PrayerDate.fromJson(json['date']) : null,
      meta: json['meta'] != null ? PrayerMeta.fromJson(json['meta']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timings': timings?.toJson(),
      'date': date?.toJson(),
      'meta': meta?.toJson(),
    };
  }
}

class Timings {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstThird;
  String? lastThird;
  String? sortAt = DateFormat('dd-MM-yyyy').format(DateTime.now());

  Timings(
      {this.fajr,
      this.sunrise,
      this.dhuhr,
      this.asr,
      this.sunset,
      this.maghrib,
      this.isha,
      this.imsak,
      this.midnight,
      this.firstThird,
      this.lastThird,
      this.sortAt
      });

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      fajr: json['Fajr'] as String?,
      sunrise: json['Sunrise'] as String?,
      dhuhr: json['Dhuhr'] as String?,
      asr: json['Asr'] as String?,
      sunset: json['Sunset'] as String?,
      maghrib: json['Maghrib'] as String?,
      isha: json['Isha'] as String?,
      imsak: json['Imsak'] as String?,
      midnight: json['Midnight'] as String?,
      firstThird: json['Firstthird'] as String?,
      lastThird: json['Lastthird'] as String?,
      sortAt: json['sortAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Fajr': fajr,
      'Sunrise': sunrise,
      'Dhuhr': dhuhr,
      'Asr': asr,
      'Sunset': sunset,
      'Maghrib': maghrib,
      'Isha': isha,
      'Imsak': imsak,
      'Midnight': midnight,
      'Firstthird': firstThird,
      'Lastthird': lastThird,
      'sortAt': sortAt
    };
  }
}

class PrayerDate {
  String? readable;
  String? timestamp;
  GregorianDate? gregorian;
  HijriDate? hijri;

  PrayerDate({this.readable, this.timestamp, this.gregorian, this.hijri});

  factory PrayerDate.fromJson(Map<String, dynamic> json) {
    return PrayerDate(
      readable: json['readable'] as String?,
      timestamp: json['timestamp'] as String?,
      gregorian: json['gregorian'] != null
          ? GregorianDate.fromJson(json['gregorian'])
          : null,
      hijri: json['hijri'] != null ? HijriDate.fromJson(json['hijri']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'readable': readable,
      'timestamp': timestamp,
      'gregorian': gregorian?.toJson(),
      'hijri': hijri?.toJson(),
    };
  }
}

class GregorianDate {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  bool? lunarSighting;

  GregorianDate(
      {this.date,
      this.format,
      this.day,
      this.weekday,
      this.month,
      this.year,
      this.designation,
      this.lunarSighting});

  factory GregorianDate.fromJson(Map<String, dynamic> json) {
    return GregorianDate(
      date: json['date'] as String?,
      format: json['format'] as String?,
      day: json['day'] as String?,
      weekday:
          json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null,
      month: json['month'] != null ? Month.fromJson(json['month']) : null,
      year: json['year'] as String?,
      designation: json['designation'] != null
          ? Designation.fromJson(json['designation'])
          : null,
      lunarSighting: json['lunarSighting'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'format': format,
      'day': day,
      'weekday': weekday?.toJson(),
      'month': month?.toJson(),
      'year': year,
      'designation': designation?.toJson(),
      'lunarSighting': lunarSighting,
    };
  }
}

class HijriDate {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  List<String>? holidays;
  List<String>? adjustedHolidays;
  String? method;

  HijriDate(
      {this.date,
      this.format,
      this.day,
      this.weekday,
      this.month,
      this.year,
      this.designation,
      this.holidays,
      this.adjustedHolidays,
      this.method});

  factory HijriDate.fromJson(Map<String, dynamic> json) {
    return HijriDate(
      date: json['date'] as String?,
      format: json['format'] as String?,
      day: json['day'] as String?,
      weekday:
          json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null,
      month: json['month'] != null ? Month.fromJson(json['month']) : null,
      year: json['year'] as String?,
      designation: json['designation'] != null
          ? Designation.fromJson(json['designation'])
          : null,
      holidays: (json['holidays'] as List?)?.cast<String>(),
      adjustedHolidays: (json['adjustedHolidays'] as List?)?.cast<String>(),
      method: json['method'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'format': format,
      'day': day,
      'weekday': weekday?.toJson(),
      'month': month?.toJson(),
      'year': year,
      'designation': designation?.toJson(),
      'holidays': holidays,
      'adjustedHolidays': adjustedHolidays,
      'method': method,
    };
  }
}

class Weekday {
  String? en;
  String? ar;

  Weekday({this.en, this.ar});

  factory Weekday.fromJson(Map<String, dynamic> json) {
    return Weekday(
      en: json['en'] as String?,
      ar: json['ar'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'en': en,
      'ar': ar,
    };
  }
}

class Month {
  int? number;
  String? en;
  String? ar;
  int? days;

  Month({this.number, this.en, this.ar, this.days});

  factory Month.fromJson(Map<String, dynamic> json) {
    return Month(
      number: json['number'] as int?,
      en: json['en'] as String?,
      ar: json['ar'] as String?,
      days: json['days'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'en': en,
      'ar': ar,
      'days': days,
    };
  }
}

class Designation {
  String? abbreviated;
  String? expanded;

  Designation({this.abbreviated, this.expanded});

  factory Designation.fromJson(Map<String, dynamic> json) {
    return Designation(
      abbreviated: json['abbreviated'] as String?,
      expanded: json['expanded'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'abbreviated': abbreviated,
      'expanded': expanded,
    };
  }
}

class PrayerMeta {
  double? latitude;
  double? longitude;
  String? timezone;
  Method? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  Map<String, int>? offset;

  PrayerMeta(
      {this.latitude,
      this.longitude,
      this.timezone,
      this.method,
      this.latitudeAdjustmentMethod,
      this.midnightMode,
      this.school,
      this.offset});

  factory PrayerMeta.fromJson(Map<String, dynamic> json) {
    return PrayerMeta(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      method: json['method'] != null ? Method.fromJson(json['method']) : null,
      latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'] as String?,
      midnightMode: json['midnightMode'] as String?,
      school: json['school'] as String?,
      offset: (json['offset'] as Map?)
          ?.map((key, value) => MapEntry(key as String, value as int)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'timezone': timezone,
      'method': method?.toJson(),
      'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
      'midnightMode': midnightMode,
      'school': school,
      'offset': offset,
    };
  }
}

class Method {
  int? id;
  String? name;
  Map<String, double>? params;
  Location? location;

  Method({this.id, this.name, this.params, this.location});

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(
      id: json['id'] as int?,
      name: json['name'] as String?,
      params: (json['params'] as Map?)?.map(
          (key, value) => MapEntry(key as String, (value as num).toDouble())),
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'params': params,
      'location': location?.toJson(),
    };
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
