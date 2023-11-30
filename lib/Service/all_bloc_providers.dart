import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture/View/Bloc/bloc.dart';
import 'package:flutter_bloc_clean_architecture/View/Cubit/cubit.dart';

var allBlocProvider = [
  // BlocProvider(create: (context) => PostCubit()),
  BlocProvider(create: (context) => ProductBloc()),
];
