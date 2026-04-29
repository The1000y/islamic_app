import 'package:equatable/equatable.dart';

import 'date.dart';
import 'meta.dart';
import 'timings.dart';

class Data extends Equatable {
  final Timings? timings;
  final Date? date;
  final Meta? meta;

  const Data({this.timings, this.date, this.meta});

  factory Data.fromDataJson(Map<String, dynamic> json) {
    return Data(
      timings: json['timings'] == null
          ? null
          : Timings.fromTimingsJson(json['timings'] as Map<String, dynamic>),
      date: json['date'] == null
          ? null
          : Date.fromDateJson(json['date'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromvMetaJson(json['meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toDataJson() {
    return {
      'timings': timings?.toTimingsJson(),
      'date': date?.toDateJson(),
      'meta': meta?.toMetaJson(),
    };
  }

  @override
  List<Object?> get props => [timings, date, meta];
}
