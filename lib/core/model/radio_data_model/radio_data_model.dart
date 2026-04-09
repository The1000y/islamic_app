import 'package:equatable/equatable.dart';

import 'radio.dart';

class RadioDataModel extends Equatable {
  final List<Radio>? radios;

  const RadioDataModel({this.radios});

  factory RadioDataModel.fromJsson(Map<String, dynamic> json) {
    return RadioDataModel(
      radios: (json['radios'] as List<dynamic>?)
          ?.map((e) => Radio.fromJssson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJsson() {
    return {'radios': radios?.map((e) => e.toJssson()).toList()};
  }

  @override
  List<Object?> get props => [radios];
}
