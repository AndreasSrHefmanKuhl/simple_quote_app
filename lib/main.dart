import 'package:flutter/material.dart';
import 'package:simple_quote_app/data/multiple_quote_repository.dart';
import 'package:simple_quote_app/data/quote_repository.dart';

import 'package:simple_quote_app/quote_app.dart';

void main() {
  final QuoteRepository quoteRepository = MultipleQuoteRepository();

  runApp(MainApp(repository: quoteRepository));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.repository});

  final QuoteRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuoteApp(repository: repository),
    );
  }
}
