import 'package:au79_web/page/home_page.dart';
import 'package:au79_web/page/impostazioni_page.dart';
import 'package:au79_web/page/riparazioni_page.dart';
import 'package:flutter/material.dart';

class RouteGeneretor {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/riparazioni':
        return MaterialPageRoute(builder: (_) => RiparazionePage());
      case '/impostazioni':
        return MaterialPageRoute(builder: (_) => const ImpostazioniPage());

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
