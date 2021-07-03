import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/model/word_response.dart';

class DetailScreen extends StatelessWidget {
  final WordResponse _wordResponse;

  const DetailScreen(this._wordResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              '${_wordResponse.word}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final meaning = _wordResponse.meanings![index];
                    final definitions = meaning.definitions;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meaning.partOfSpeech!,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ListView.separated(
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Definition : ${definitions![index].definition}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              if (definitions[index].example != null)
                                Text(
                                    'Sentences : ${definitions[index].example}',
                                    style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 4,
                          ),
                          itemCount: definitions!.length,
                          shrinkWrap: true,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 32,
                      ),
                  itemCount: _wordResponse.meanings!.length),
            )
          ],
        ),
      ),
    );
  }
}
