import 'package:equatable/equatable.dart';

class Month extends Equatable {
  final int? number;
  final String? en;
  final String? ar;
  final int? days;

  const Month({this.number, this.en, this.ar, this.days});

  factory Month.fromCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(
    Map<String, dynamic> json,
  ) {
    return Month(
      number: json['number'] as int?,
      en: json['en'] as String?,
      ar: json['ar'] as String?,
      days: json['days'] as int?,
    );
  }

  Map<String, dynamic>
  toCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0() {
    return {'number': number, 'en': en, 'ar': ar, 'days': days};
  }

  @override
  List<Object?> get props => [number, en, ar, days];
}
