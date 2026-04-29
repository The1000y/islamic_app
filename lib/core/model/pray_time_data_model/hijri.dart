import 'package:equatable/equatable.dart';

import 'designation.dart';
import 'month.dart';
import 'weekday.dart';

class Hijri extends Equatable {
  final String? date;
  final String? format;
  final String? day;
  final Weekday? weekday;
  final Month? month;
  final String? year;
  final Designation? designation;
  final List<dynamic>? holidays;
  final List<dynamic>? adjustedHolidays;
  final String? method;

  const Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
    this.adjustedHolidays,
    this.method,
  });

  factory Hijri.fromCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(
    Map<String, dynamic> json,
  ) {
    return Hijri(
      date: json['date'] as String?,
      format: json['format'] as String?,
      day: json['day'] as String?,
      weekday: json['weekday'] == null
          ? null
          : Weekday.fromCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(
              json['weekday'] as Map<String, dynamic>,
            ),
      month: json['month'] == null
          ? null
          : Month.fromCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(
              json['month'] as Map<String, dynamic>,
            ),
      year: json['year'] as String?,
      designation: json['designation'] == null
          ? null
          : Designation.fromCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(
              json['designation'] as Map<String, dynamic>,
            ),
      holidays: json['holidays'] as List<dynamic>?,
      adjustedHolidays: json['adjustedHolidays'] as List<dynamic>?,
      method: json['method'] as String?,
    );
  }

  Map<String, dynamic>
  toCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0() {
    return {
      'date': date,
      'format': format,
      'day': day,
      'weekday': weekday
          ?.toCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(),
      'month': month
          ?.toCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(),
      'year': year,
      'designation': designation
          ?.toCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(),
      'holidays': holidays,
      'adjustedHolidays': adjustedHolidays,
      'method': method,
    };
  }

  @override
  List<Object?> get props {
    return [
      date,
      format,
      day,
      weekday,
      month,
      year,
      designation,
      holidays,
      adjustedHolidays,
      method,
    ];
  }
}
