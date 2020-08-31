class NumberTrivia {
  String text;
  int number;

  NumberTrivia({this.text, this.number});

  NumberTrivia.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    number = json['number'];
  }
}
