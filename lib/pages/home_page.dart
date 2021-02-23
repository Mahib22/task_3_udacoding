import 'package:flutter/material.dart';
import './luas_page.dart' as luas;
import './volume_page.dart' as volume;
import './konversi_page.dart' as konversi;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text('Math App'),
        ),
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: 'Luas',
            ),
            Tab(
              text: 'Volume',
            ),
            Tab(
              text: 'Konversi',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          luas.LuasPage(),
          volume.VolumePage(),
          konversi.KonversiPage(),
        ],
      ),
    );
  }
}
