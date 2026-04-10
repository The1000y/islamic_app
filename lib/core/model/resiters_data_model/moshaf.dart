import 'package:equatable/equatable.dart';

class Moshaf extends Equatable {
  final int? id;
  final String? name;
  final String? server;
  final int? surahTotal;
  final int? moshafType;
  final String? surahList;

  const Moshaf({
    this.id,
    this.name,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  factory Moshaf.fromJsonMoshaf(Map<String, dynamic> json) {
    return Moshaf(
      id: json['id'] as int?,
      name: json['name'] as String?,
      server: json['server'] as String?,
      surahTotal: json['surah_total'] as int?,
      moshafType: json['moshaf_type'] as int?,
      surahList: json['surah_list'] as String?,
    );
  }

  Map<String, dynamic> toJsonMoshaf() {
    return {
      'id': id,
      'name': name,
      'server': server,
      'surah_total': surahTotal,
      'moshaf_type': moshafType,
      'surah_list': surahList,
    };
  }

  @override
  List<Object?> get props {
    return [id, name, server, surahTotal, moshafType, surahList];
  }
}
