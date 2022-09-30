import 'package:au79_web/bloc/clients/clients_bloc.dart';
import 'package:au79_web/bloc/repair/repair_bloc.dart';
import 'package:au79_web/page/home_page.dart';
import 'package:au79_web/page/log_in.dart';
import 'package:au79_web/repository/client_repository.dart';
import 'package:au79_web/repository/repair_repository.dart';
import 'package:au79_web/route/route_generator.dart';
import 'package:au79_web/themes/dark_theme.dart';
import 'package:au79_web/themes/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Firebase cli method https://firebase.flutter.dev/docs/cli/

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (_) => RepairBloc(repairRepository: RepairRepository())),
    BlocProvider(
      create: (_) => ClientsBloc(clientRepository: ClientRepository()),
    ),
    BlocProvider(
        create: (_) => ClientsBloc(clientRepository: ClientRepository()))
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
    return GetMaterialApp(
      //here I use Getx
      debugShowCheckedModeBanner: false,
      title: 'Au79',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: _themeMode,
      initialRoute: '/',
      onGenerateRoute: RouteGeneretor.generateRoute,
      home: LoginPage(),
    );
  }
}
