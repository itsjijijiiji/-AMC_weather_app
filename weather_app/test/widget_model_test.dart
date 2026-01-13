import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather.dart';

void main() {
  group('Weather.fromJson', () {
    test('should correctly parse a valid JSON response from OpenWeatherMap', () {
      // A realistic sample JSON response from the OpenWeatherMap API for Manila.
      // This data represents a typical structure you would receive. [3, 4]
      const jsonString = '''
      {
        "coord": {
          "lon": 120.98,
          "lat": 14.6
        },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04n"
          }
        ],
        "base": "stations",
        "main": {
          "temp": 28.3,
          "feels_like": 32.8,
          "temp_min": 27.7,
          "temp_max": 29.0,
          "pressure": 1010,
          "humidity": 83
        },
        "visibility": 10000,
        "wind": {
          "speed": 2.57,
          "deg": 230
        },
        "clouds": {
          "all": 75
        },
        "dt": 1673584980,
        "sys": {
          "type": 1,
          "id": 8160,
          "country": "PH",
          "sunrise": 1673562283,
          "sunset": 1673603099
        },
        "timezone": 28800,
        "id": 1701668,
        "name": "Manila",
        "cod": 200
      }
      ''';

      // 1. Decode the JSON string into a Map.
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // 2. Use the fromJson factory to create a Weather object.
      final weather = Weather.fromJson(jsonMap);

      // 3. Assert and verify that the object's properties match the JSON data.
      expect(weather.city, 'Manila');
      expect(weather.temperature, 28.3);
      expect(weather.description, 'Clouds');
      expect(weather.humidity, 83);
      expect(weather.windSpeed, 2.57);
    });
  });
}