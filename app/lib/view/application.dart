import 'package:app/data/data.dart';
import 'package:app/logic/home/home_bloc.dart';
import 'package:app/main.dart';
import 'package:app/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

typedef Create<T> = T Function(BuildContext context);

class SummitApplication extends StatelessWidget {
  const SummitApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
      theme: ThemeData.light(),
      themeMode: Data.getThemeMode(),
      darkTheme: ThemeData.dark(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => RxBlocProvider<HomeBlocType>(
            create: (c) => getIt<HomeBloc>(),
            child: const HomeScreen())),
      ]
  );
}
