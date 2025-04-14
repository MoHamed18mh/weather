abstract class EndPoint {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String weatherApiKey = '8fa265b0564e97ba7f9e3ec304e49e37';
  static const String currentWeather = '/weather';
  static const String forecast = '/forecast';
}

abstract class ApiKey {
  static const String coord = 'coord',
      lon = 'lon',
      lat = 'lat',
      weather = 'weather',
      id = 'id',
      main = 'main',
      description = 'description',
      icon = 'icon',
      base = 'base',
      temp = 'temp',
      feelsLike = 'feels_like',
      tempMin = 'temp_min',
      tempMax = 'temp_max',
      pressure = 'pressure',
      humidity = 'humidity',
      seaLevel = 'sea_level',
      grndLevel = 'grnd_level',
      visibility = 'visibility',
      wind = 'wind',
      speed = 'speed',
      deg = 'deg',
      gust = 'gust',
      clouds = 'clouds',
      rain = 'rain',
      all = 'all',
      dt = 'dt',
      sys = 'sys',
      type = 'type',
      country = 'country',
      sunrise = 'sunrise',
      sunset = 'sunset',
      timezone = 'timezone',
      name = 'name',
      cod = 'cod',
      pop = 'pop',
      pod = 'pod',
      dtTxt = 'dt_txt',
      cnt = 'cnt',
      population = 'population',
      list = 'list',
      message = 'message',
      tempKf = 'temp_kf',
      oneHour = '1h',
      threeHour = '3h',

      // QueryParams
      appid = 'appid',
      q = 'q',
      units = 'units',
      metric = 'metric',
      city = 'city';
}
