import 'package:equatable/equatable.dart';

import 'data.dart';

class PrayTimeDataModel extends Equatable {
  final int? code;
  final String? status;
  final Data? data;

  const PrayTimeDataModel({this.code, this.status, this.data});

  factory PrayTimeDataModel.fromPrayTimeDataModelJson(
    Map<String, dynamic> json,
  ) {
    return PrayTimeDataModel(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromDataJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toPrayTimeDataModelJson() {
    return {'code': code, 'status': status, 'data': data?.toDataJson()};
  }

  @override
  List<Object?> get props => [code, status, data];
}
