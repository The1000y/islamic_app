import 'package:equatable/equatable.dart';

class Radio extends Equatable {
  final int? id;
  final String? name;
  final String? url;
  final String? recentDate;

  const Radio({this.id, this.name, this.url, this.recentDate});

  factory Radio.fromJssson(Map<String, dynamic> json) {
    return Radio(
      id: json['id'] as int?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      recentDate: json['recent_date'] as String?,
    );
  }

  Map<String, dynamic> toJssson() {
    return {'id': id, 'name': name, 'url': url, 'recent_date': recentDate};
  }

  @override
  List<Object?> get props => [id, name, url, recentDate];
}
