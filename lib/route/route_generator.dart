import 'package:au79_web/page/clients_insert_page.dart';
import 'package:au79_web/page/home_page.dart';
import 'package:au79_web/page/impostazioni_page.dart';
import 'package:au79_web/page/ins_mod_repair.dart';
import 'package:au79_web/page/log_in.dart';

import 'package:au79_web/page/repairs_page.dart';
import 'package:flutter/material.dart';

class RouteGeneretor {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Login_page());
      case '/riparazioni':
        return MaterialPageRoute(builder: (_) => RiparazionePage());
      case '/impostazioni':
        return MaterialPageRoute(builder: (_) => const ImpostazioniPage());
      case '/ins_mod_repair':
        return MaterialPageRoute(builder: (_) => const InsModRepair());
      case '/clients_page':
        return MaterialPageRoute(builder: (_) => const ClientsInsertPage());

      /* case '/edit_employee':
        if (args is int) {
          return MaterialPageRoute(
              builder: (_) => EditEmployeeScreen(
                    id: args,
                  )); 
        
        return _errorRoute();}*/

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return (MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No Rute'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Sorry no route was found',
            style: TextStyle(color: Colors.red, fontSize: 18.0),
          ),
        ),
      );
    }));
  }
}
