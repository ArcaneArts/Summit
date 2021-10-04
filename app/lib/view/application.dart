import 'package:app/data/data.dart';
import 'package:app/data/server/server_provider.dart';
import 'package:app/logic/home/home_bloc.dart';
import 'package:app/main.dart';
import 'package:app/util/l.dart';
import 'package:app/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

typedef Create<T> = T Function(BuildContext context);

class SummitApplication extends StatelessWidget {
  const SummitApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ServerProvider p = gx<ServerProvider>();
    L.i("Got server provider");

    return GetMaterialApp(
        theme: ThemeData.light(),
        themeMode: Data.getThemeMode(),
        darkTheme: ThemeData.dark(),
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: () => RxBlocProvider<HomeBlocType>(
              create: (c) => gx<HomeBloc>(),
              child: const HomeScreen())),
        ]
    );
  }
}
