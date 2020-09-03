import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Placeholder(),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
