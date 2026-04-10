import 'package:equatable/equatable.dart';

import 'reciter.dart';

class ResitersDataModel extends Equatable {
  final List<Reciter>? reciters;

  const ResitersDataModel({this.reciters});

  factory ResitersDataModel.fromJsonResitersDataModel(
    Map<String, dynamic> json,
  ) {
    return ResitersDataModel(
      reciters: (json['reciters'] as List<dynamic>?)
          ?.map((e) => Reciter.fromJsonResiter(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJsonResiterDataModel() {
    return {'reciters': reciters?.map((e) => e.toJsonResiter()).toList()};
  }

  @override
  List<Object?> get props => [reciters];
}
