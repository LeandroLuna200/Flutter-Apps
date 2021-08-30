// Generated by https://quicktype.io

class Clima {
  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;
  List<Current> hourly;
  List<Daily> daily;

  Clima({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.hourly,
    this.daily,
  });

  Clima.fromJsonMap( Map< String, dynamic> json ) {
    lat             = json[ 'lat' ];
    lon             = json[ 'lon' ];
    timezone        = json[ 'timezone' ];
    timezoneOffset  = json[ 'timezone_offset' ];
    current         = json[ 'lat' ];
    hourly          = json[ 'lat' ];
    daily           = json[ 'lat' ];
  }
}

class Current {
  int dt;
  int sunrise;
  int sunset;
  double temp;
  double feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double uvi;
  int clouds;
  int visibility;
  double windSpeed;
  int windDeg;
  List<Weather> weather;
  double windGust;
  double pop;
  double rain;

  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.weather,
    this.windGust,
    this.pop,
    this.rain,
  });
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
}


class Daily {
  int dt;
  int sunrise;
  int sunset;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  int windDeg;
  List<Weather> weather;
  int clouds;
  double pop;
  double uvi;
  double rain;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,
    this.rain,
  });
}

class FeelsLike {
  double day;
  double night;
  double eve;
  double morn;

  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });
}

class Temp {
  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });
}
