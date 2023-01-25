import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_api_4/presentation/bloc/users_bloc.dart';
import 'package:test_api_4/presentation/bloc/users_bloc_event.dart';
import 'package:test_api_4/presentation/bloc/users_bloc_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      context.read<UsersBloc>().add(OnGetUsersEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List"),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadedEmpty) {
            return const CircularProgressIndicator();
          } else if (state is UsersLoadedSucceed) {
            return ListView.builder(
                itemCount: state.result.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(state.result[index].name),
                        Text(state.result[index].email)
                      ],
                    ),
                  );
                });
          } else {
            return const Text("There was an error!");
          }
        },
      ),
    );
  }
}
