import 'package:au79_web/bloc/clientIdExternal/clientIdExternalBloc.dart';
import 'package:au79_web/bloc/clients/clients_bloc.dart';
import 'package:au79_web/bloc/repair/repair_bloc.dart';
import 'package:au79_web/page/home_page.dart';
import 'package:au79_web/repository/client_repository.dart';
import 'package:au79_web/repository/repair_repository.dart';
import 'package:au79_web/route/route_generator.dart';
import 'package:au79_web/themes/dark_theme.dart';
import 'package:au79_web/themes/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC4rNUMf6aXDzwgwaW_S3Nh93z_tYdn1wI",
          authDomain: "au79web.firebaseapp.com",
          projectId: "au79web",
          storageBucket: "au79web.appspot.com",
          messagingSenderId: "122206798164",
          appId: "1:122206798164:web:913b7627a3c3064f7288c1",
          measurementId: "G-SM21S8496E"));

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (_) => RepairBloc(repairRepository: RepairRepository())
          ..add(const LoadRepairs())),
    BlocProvider(
      create: (_) => ClientsBloc(clientRepository: ClientRepository())
        ..add(const LoadClients()),
    ),
    BlocProvider(
        create: (_) =>
            ClientIdExternalBloc(clientRepository: ClientRepository())
              ..add(LoadIdExtEvent()))
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
