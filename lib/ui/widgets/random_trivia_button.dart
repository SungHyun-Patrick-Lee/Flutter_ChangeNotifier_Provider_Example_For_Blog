import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_example_for_blog/core/viewmodels/number_trivia_model.dart';
import 'package:provider/provider.dart';

class RandomTriviaButton extends StatefulWidget {
  const RandomTriviaButton({
    Key key,
  }) : super(key: key);

  @override
  _RandomTriviaButtonState createState() => _RandomTriviaButtonState();
}

class _RandomTriviaButtonState extends State<RandomTriviaButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('Random Trivia'),
        color: Theme.of(context).accentColor,
        textTheme: ButtonTextTheme.primary,
        onPressed: () {
          randomNumberTrivia(context);
        });
  }
}

void randomNumberTrivia(BuildContext context) {
  Provider.of<NumberTriviaModel>(context, listen: false)
      .getRandomNumberTrivia();
}
