import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:http/http.dart' as http;
import 'package:islami/core/model/radio_data_model/radio_data_model.dart';

class ApiManager {
  //https://www.mp3quran.net/api/v3/radios?language=eng

  static Future<RadioDataModel> getRadioData() async {
    try {
      Uri url = Uri.parse(
        'https://www.mp3quran.net/api/v3/radios?language=eng',
      );
      var response = await http.get(url);
      var result = jsonDecode(response.body);
      return RadioDataModel.fromJsson(result);
    } on Exception catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }
}
