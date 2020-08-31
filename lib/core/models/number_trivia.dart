import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable {
  String text;
  int number;

  NumberTrivia({this.text, this.number});

  NumberTrivia.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    number = json['number'];
  }

  @override
  List<Object> get props => [text, number];
}
