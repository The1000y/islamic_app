import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:islami/core/model/pray_time_data_model/pray_time_data_model.dart';
// import 'package:http/http.dart' as http;
import 'package:islami/core/model/radio_data_model/radio_data_model.dart';
import 'package:islami/core/model/resiters_data_model/resiters_data_model.dart';

class ApiManager {
  //https://www.mp3quran.net/api/v3/radios?language=eng

  static Future<RadioDataModel> getRadioData() async {
    try {
      Uri url = Uri.parse('https://mp3quran.net/api/v3/radios?language=ar');
      var response = await http.get(url);
      var result = jsonDecode(response.body);
      return RadioDataModel.fromJsson(result);
    } on Exception catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  static Future<ResitersDataModel> getResiterData() async {
    try {
      Uri url = Uri.parse('https://www.mp3quran.net/api/v3/reciters');
      var response = await http.get(url);
      var data = jsonDecode(response.body);
      return ResitersDataModel.fromJsonResitersDataModel(data);
    } on Exception catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  static Future<PrayTimeDataModel> getPrayTime() async {
    try {
      String timeNow = DateFormat('dd-MM-yyyy').format(DateTime.now());
      Uri url = Uri.parse(
        'https://api.aladhan.com/v1/timingsByCity/$timeNow?city=suez&country=egypt',
      );
      var response = await http.get(url);
      var responseDate = jsonDecode(response.body);
      return PrayTimeDataModel.fromPrayTimeDataModelJson(responseDate);
    } catch (e) {
      throw e;
    }
  }
}
