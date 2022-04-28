import 'package:au79_web/blocs/clients/clients_bloc.dart';
import 'package:au79_web/blocs/list_rip_bloc.dart';
import 'package:au79_web/blocs/repairs/repairs_bloc.dart';
import 'package:au79_web/page/home_page.dart';
import 'package:au79_web/route/route_generator.dart';
import 'package:au79_web/themes/dark_theme.dart';
import 'package:au79_web/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => ListRepairBloc()),
    BlocProvider(create: (_) => RepairsBloc()),
    BlocProvider(create: (_) => ClientsBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    /* final virtualWindowFrameBuilder = VirtualWindowFrameInit();
    final botToastBuilder = BotToastInit(); */
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Au79',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: _themeMode,
      initialRoute: '/',
      onGenerateRoute: RouteGeneretor.generateRoute,
      home: HomePage(),
    );
  }
}
