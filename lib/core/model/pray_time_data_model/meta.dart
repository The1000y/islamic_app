import 'package:equatable/equatable.dart';

import 'method.dart';
import 'offset.dart';

class Meta extends Equatable {
  final double? latitude;
  final double? longitude;
  final String? timezone;
  final Method? method;
  final String? latitudeAdjustmentMethod;
  final String? midnightMode;
  final String? school;
  final Offset? offset;

  const Meta({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
    this.offset,
  });

  factory Meta.fromvMetaJson(Map<String, dynamic> json) {
    return Meta(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      method: json['method'] == null
          ? null
          : Method.fromCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(
              json['method'] as Map<String, dynamic>,
            ),
      latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'] as String?,
      midnightMode: json['midnightMode'] as String?,
      school: json['school'] as String?,
      offset: json['offset'] == null
          ? null
          : Offset.fromCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(
              json['offset'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toMetaJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'timezone': timezone,
      'method': method
          ?.toCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(),
      'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
      'midnightMode': midnightMode,
      'school': school,
      'offset': offset
          ?.toCode200StatusOkDataTimingsFajr0422Sunrise0604Dhuhr1301Asr1638Sunset1957Maghrib1957Isha2128Imsak0412Midnight0101Firstthird2320Lastthird0242DateReadable16Jul2024Timestamp1721102400HijriDate10011446FormatDdMmYyyyDay10WeekdayEnAlThalaataArMonthNumber1EnMuArramArDays29Year1446DesignationAbbreviatedAhExpandedAnnoHegiraeHolidaysAshuraUrsOfShaykhShamsuddinHabBAllahUrsOfShaykhAbAlHassanAlKharqNiBirthOfImamRBbaniAhmadAlFRuqiAsSirhindiAdjustedHolidaysMethodHjCoSaGregorianDate16072024FormatDdMmYyyyDay16WeekdayEnTuesdayMonthNumber7EnJulyYear2024DesignationAbbreviatedAdExpandedAnnoDominiLunarSightingFalseMetaLatitude88888888Longitude77777777TimezoneAfricaCairoMethodId5NameEgyptianGeneralAuthorityOfSurveyParamsFajr195Isha175LocationLatitude300444196Longitude312357116LatitudeAdjustmentMethodAngleBasedMidnightModeStandardSchoolStandardOffsetImsak0Fajr0Sunrise0Dhuhr0Asr0Maghrib0Sunset0Isha0Midnight0(),
    };
  }

  @override
  List<Object?> get props {
    return [
      latitude,
      longitude,
      timezone,
      method,
      latitudeAdjustmentMethod,
      midnightMode,
      school,
      offset,
    ];
  }
}
