import 'package:au79_web/repository/client_repository.dart';
import 'package:flutter/material.dart';

class ImpostazioniPage extends StatefulWidget {
  const ImpostazioniPage({Key? key}) : super(key: key);

  @override
  State<ImpostazioniPage> createState() => _ImpostazioniPageState();
}

class _ImpostazioniPageState extends State<ImpostazioniPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Impostazioni")),
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: const FlutterLogo(),
                title: const Text('Cambia colore thema'),
                trailing: ElevatedButton(
                    onPressed: () {
                      /* ThemeMode newThemeMode =
                          sharedConfig.themeMode == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;

                      await sharedConfigManager.setThemeMode(newThemeMode);
                      await windowManager.setBrightness(
                        newThemeMode == ThemeMode.light
                            ? Brightness.light
                            : Brightness.dark,
                      ); */
                      ClientRepository repository = ClientRepository();
                      repository.getData();
                    },
                    child: Text("switch dark/Light")),
              ),
            ),
          ],
        ));
  }
}
