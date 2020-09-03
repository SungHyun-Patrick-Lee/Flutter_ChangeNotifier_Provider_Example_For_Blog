import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_example_for_blog/core/enums/viewmodel_state.dart';
import 'package:flutter_provider_example_for_blog/core/viewmodels/number_trivia_model.dart';
import 'package:flutter_provider_example_for_blog/injection_container.dart';
import 'package:provider/provider.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NumberTriviaRandom'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  ChangeNotifierProvider<NumberTriviaModel> buildBody(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<NumberTriviaModel>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: buildDiscriptionText(),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: RandomTriviaButton(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Consumer<NumberTriviaModel> buildDiscriptionText() {
    return Consumer<NumberTriviaModel>(
      builder: (context, value, child) {
        if (value.state == ViewModelState.Busy) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (value.numberTrivia == null) {
            return Center(
              child: Text(
                'Press Button',
                style: TextStyle(fontSize: 25),
              ),
            );
          } else {
            return Text(
              value.numberTrivia.text,
              style: TextStyle(fontSize: 25),
            );
          }
        }
      },
    );
  }
}

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
