import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NumberTrivia extends Equatable {
  String text;
  int number;

  NumberTrivia({
    @required this.text,
    @required this.number,
  });

  NumberTrivia.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    number = (json['number'] as num).toInt();
  }

  @override
  List<Object> get props => [text, number];
}
