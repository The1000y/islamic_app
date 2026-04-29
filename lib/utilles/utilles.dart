import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeConventer {
  static String convert12Hourse(String time) {
    DateTime newTime = DateFormat('HH:mm').parse(time);
    String formattedTime = DateFormat('hh:mm\n a').format(newTime);
    return formattedTime;
  }
}

class PrayerTime {
  static Map<String, dynamic> sortPrayerTime(Map<String, dynamic> prayerTime) {
    DateTime now = DateTime.now();

    var pryerTimeList = prayerTime.entries.toList()
      ..sort((a, b) {
        DateTime timeA = DateFormat('HH:mm').parse(a.value);
        DateTime timeB = DateFormat('HH:mm').parse(b.value);

        DateTime dateTimeA = DateTime(
          now.year,
          now.month,
          now.day,
          timeA.hour,
          timeA.minute,
        );
        DateTime dateTimeB = DateTime(
          now.year,
          now.month,
          now.day,
          timeB.hour,
          timeB.minute,
        );

        if (dateTimeA.isBefore(now) || dateTimeA.isAtSameMomentAs(now)) {
          dateTimeA = dateTimeA.add(Duration(days: 1));
        }

        if (dateTimeB.isBefore(now) || dateTimeB.isAtSameMomentAs(now)) {
          dateTimeB = dateTimeB.add(Duration(days: 1));
        }

        return dateTimeA.compareTo(dateTimeB);
      });
    return Map.fromEntries(pryerTimeList);
  }

  static Map<String, Duration> getNextPrayerCountDownTime(
    Map<String, dynamic> prayerTime,
  ) {
    DateTime now = DateTime.now();
    Map<String, Duration> timediffrence = {};

    prayerTime.forEach((prayerName, timeString) {
      DateTime prayerTime = DateFormat('HH:mm').parse(timeString);
      DateTime prayerDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        prayerTime.hour,
        prayerTime.minute,
      );

      if (prayerDateTime.isBefore(now) ||
          prayerDateTime.isAtSameMomentAs(now)) {
        prayerDateTime = prayerDateTime.add(Duration(days: 1));
      }

      Duration duration = prayerDateTime.difference(now);
      timediffrence[prayerName] = duration;
    });
    return timediffrence;
  }
}

class FormatDuration {
  String format(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String hours = twoDigits(d.inHours);
    String minutes = twoDigits(d.inMinutes.remainder(60));
    String seconds = twoDigits(d.inSeconds.remainder(60));

    return "$hours:$minutes:$seconds";
  }
}

class CasheData {
  static Future<void> setOnBoardingScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoarding', false);
  }

  static Future<bool> getOnBoardingScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onBoarding') ?? true;
  }
}
