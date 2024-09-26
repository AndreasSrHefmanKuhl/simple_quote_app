import 'package:flutter/material.dart';
import 'package:simple_quote_app/data/quote_repository.dart';
import 'package:simple_quote_app/model/quote_data.dart';

class QuoteApp extends StatefulWidget {
  const QuoteApp({super.key, required this.repository});

  final QuoteRepository repository;

  @override
  State<QuoteApp> createState() => QuoteAppState();
}

class QuoteAppState extends State<QuoteApp> {
  late QuoteData currentQuote;
  @override
  void initState() {
    super.initState();
    currentQuote = widget.repository.getQuote();
  }

  @override
  Widget build(BuildContext context) {
    final String author = currentQuote.author;
    final String text = currentQuote.text;
    final int ranking = currentQuote.ranking;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Quote App"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 128),
              const Text(
                "Willkommen zur Zitate-App!",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 64),
              Text(
                text,
                //style: const TextStyle(fontSize: 16),
              ),
              Text("- $author"),
              const SizedBox(height: 16),
              Text("Ranking: $ranking/10"),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentQuote = widget.repository.getQuote();
                    });
                  },
                  child: const Icon(Icons.refresh))
            ],
          ),
        ),
      ),
    );
  }
}
