import 'package:equatable/equatable.dart';

class Offset extends Equatable {
  final int? imsak;
  final int? fajr;
  final int? sunrise;
  final int? dhuhr;
  final int? asr;
  final int? maghrib;
  final int? sunset;
  final int? isha;
  final int? midnight;

  const Offset({
    this.imsak,
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.sunset,
    this.isha,
    this.midnight,
  });

  factory Offset.fromCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(
    Map<String, dynamic> json,
  ) {
    return Offset(
      imsak: json['Imsak'] as int?,
      fajr: json['Fajr'] as int?,
      sunrise: json['Sunrise'] as int?,
      dhuhr: json['Dhuhr'] as int?,
      asr: json['Asr'] as int?,
      maghrib: json['Maghrib'] as int?,
      sunset: json['Sunset'] as int?,
      isha: json['Isha'] as int?,
      midnight: json['Midnight'] as int?,
    );
  }

  Map<String, dynamic>
  toCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0() {
    return {
      'Imsak': imsak,
      'Fajr': fajr,
      'Sunrise': sunrise,
      'Dhuhr': dhuhr,
      'Asr': asr,
      'Maghrib': maghrib,
      'Sunset': sunset,
      'Isha': isha,
      'Midnight': midnight,
    };
  }

  @override
  List<Object?> get props {
    return [imsak, fajr, sunrise, dhuhr, asr, maghrib, sunset, isha, midnight];
  }
}
