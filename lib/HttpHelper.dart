import 'package:http/http.dart' as http;
import 'dart:io';

class HttpHelper {
  final String _urlKey = "&appid=439d4b804bc8187953eb36d2a8c26a02";
  final String _urlBase = "https://openweathermap.org";

  Future<String> Medan() async {
    var url =
        Uri.parse(_urlBase + "/data/2.5/weather?lat=3.59&lon=98.67" + _urlKey);
    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      return responseBody;
    }
    return result.statusCode.toString();
  }
}
