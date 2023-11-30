import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture/View/Cubit/cubit.dart';
import 'package:flutter_bloc_clean_architecture/View/Cubit/cubit_states.dart';

class CubitHomeScreen extends StatefulWidget {
  const CubitHomeScreen({super.key});

  @override
  State<CubitHomeScreen> createState() => _CubitHomeScreenState();
}

class _CubitHomeScreenState extends State<CubitHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostCubit>().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clean Architecture Cubit"),
      ),
      body: Center(
        child: BlocBuilder<PostCubit, CubitPostState>(
          builder: (context, state) {
            if (state is CubitPostInitial) {
              return const Text("Init Data Loading...!");
            } else if (state is CubitPostLoading) {
              return const CircularProgressIndicator();
            } else if (state is CubitPostError) {
              return Text(state.errorMessage);
            } else if (state is CubitPostLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("${state.posts[index].id}"),
                    title: Text("${state.posts[index].title}"),
                  );
                },
              );
            } else {
              return const Text("Something Went Wrong...!");
            }
          },
        ),
      ),
    );
  }
}
