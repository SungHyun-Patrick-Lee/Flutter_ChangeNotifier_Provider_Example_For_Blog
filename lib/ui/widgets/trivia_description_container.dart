import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_example_for_blog/core/enums/viewmodel_state.dart';
import 'package:flutter_provider_example_for_blog/core/viewmodels/number_trivia_model.dart';
import 'package:provider/provider.dart';

Consumer<NumberTriviaModel> buildDiscriptionContainer() {
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
          return Column(
            children: [
              Text(
                value.numberTrivia.number.toString(),
                style: TextStyle(
                  fontSize: 40,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                child: Text(
                  value.numberTrivia.text,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        }
      }
    },
  );
}
