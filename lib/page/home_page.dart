import 'package:au79_web/widgets/drawer_custom_widget.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          appBar: AppBar(),
          drawer: const DrawerCustomWidget(),
          body:
              Container() /* DefaultTabController(
            length: 6,
            child: Scaffold(
              body: NestedScrollView(
                floatHeaderSlivers: false,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    const SliverAppBar(
                      //title: Text('Tabs Demo'),
                      toolbarHeight: 10,
                      pinned: false,
                      floating: false,
                      bottom: TabBar(
                        isScrollable: false,
                        tabs: [
                          Tab(
                            child: Text('Vendita'),
                          ),
                          Tab(child: Text('Oreficeria')),
                          Tab(child: Text('Orologeria')),
                          Tab(child: Text('Gioielleria')),
                          Tab(child: Text('Argernteria')),
                          Tab(child: Text('Riparazioni')),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    Icon(Icons.flight, size: 350),
                    Icon(Icons.directions_transit, size: 350),
                    Icon(Icons.directions_car, size: 350),
                    Icon(Icons.directions_bike, size: 350),
                    Icon(Icons.directions_boat, size: 350),
                    RiparazionePage(),
                  ],
                ),
              ),
            )),
       */
          ),
    );
  }
}
