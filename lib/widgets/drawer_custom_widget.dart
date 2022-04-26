import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 65.0,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: const Text('Au79'),
            ),
          ),
          ExpansionTile(
            leading: const Icon(Icons.archive_outlined),
            title: const Text('Magazzino'),
            children: [
              ListTile(
                title: const Text('inserimento'),
                onTap: () {
                  // Navigator.pushNamed(context, '/riparazioni');
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.key),
            title: const Text('Riparazioni'),
            onTap: () {
              Navigator.pushNamed(context, '/riparazioni');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Impostazioni'),
            onTap: () {
              Navigator.pushNamed(context, '/impostazioni');
            },
          ),
        ],
      ),
    );
  }
}
