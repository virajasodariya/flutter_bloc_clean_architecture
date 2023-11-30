import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture/Api/api_response.dart';
import 'package:flutter_bloc_clean_architecture/Model/product_response_model.dart';
import 'package:flutter_bloc_clean_architecture/View/Bloc/bloc.dart';
import 'package:flutter_bloc_clean_architecture/View/Bloc/bloc_events.dart';
import 'package:flutter_bloc_clean_architecture/View/Bloc/bloc_states.dart';

class BlocHomeScreen extends StatefulWidget {
  const BlocHomeScreen({super.key});

  @override
  State<BlocHomeScreen> createState() => _BlocHomeScreenState();
}

class _BlocHomeScreenState extends State<BlocHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(BlocProductFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clean Architecture Cubit"),
      ),
      body: Center(
        child: BlocBuilder<ProductBloc, BlocProductState>(
          builder: (context, state) {
            if (state is BlocStateWrapper<ProductResponseModel>) {
              var apiResponse = state.apiResponse;
              if (apiResponse.status == Status.LOADING) {
                return const CircularProgressIndicator();
              } else if (apiResponse.status == Status.COMPLETE) {
                return ListView.builder(
                  itemCount: apiResponse.data!.products!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("${apiResponse.data!.products![index].id}"),
                      title:
                          Text("${apiResponse.data!.products![index].title}"),
                      subtitle: Image.network(
                          "${apiResponse.data!.products![index].thumbnail}"),
                    );
                  },
                );
              } else if (apiResponse.status == Status.ERROR) {
                return Text("${apiResponse.message}");
              } else {
                return const Text("Something Went Wrong...!");
              }
            } else {
              return const Text('Unexpected State');
            }
          },
        ),
      ),
    );
  }
}
