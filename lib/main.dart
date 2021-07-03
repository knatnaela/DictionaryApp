import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dictionary_app/bloc/dictionary_cubit.dart';
import 'package:flutter_dictionary_app/repository/word_repository.dart';
import 'package:flutter_dictionary_app/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => DictionaryCubit(WordRepository()),
        child: HomeScreen(),
      ),
    );
  }
}
