import 'package:app/logic/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          RxResultBuilder<HomeBlocType, bool>(
              state: (b) => b.states.pong,
              buildSuccess: (c,d,b) => Text("Pong: $d"),
              buildError: (c,e, b) => Text("Error: $e"),
              buildLoading: (c, b) => CircularProgressIndicator()),
          TextButton(onPressed: () => RxBlocProvider.of<HomeBlocType>(context).events.ping(),
              child: Text("Ping"))
        ],
      ),
    ),
  );
}
