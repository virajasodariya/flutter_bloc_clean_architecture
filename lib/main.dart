import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture/Service/all_bloc_providers.dart';
import 'package:flutter_bloc_clean_architecture/View/Bloc/home_screen.dart';
import 'package:flutter_bloc_clean_architecture/View/Cubit/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: allBlocProvider,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocHomeScreen(),
      ),
    );
  }
}
