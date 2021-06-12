import 'package:flutter/material.dart';

import '../screens/screens.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'COVID19 TRACKING',
          style: const TextStyle(letterSpacing: 1),
        ),
        bottom: TabBar(
          controller: _tabController,
          physics: const BouncingScrollPhysics(),
          indicatorWeight: 5,
          labelPadding: const EdgeInsets.symmetric(horizontal: 12),
          tabs: [
            const Tab(
              icon: const Icon(Icons.public_outlined, size: 30),
              text: 'GLOBAL',
            ),
            const Tab(
              icon: const Icon(Icons.list_alt_rounded, size: 30),
              text: 'ALL-COUNTRIES',
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: _tabController,
        children: [GlobalScreen(), AllCountriesScreen()],
      ),
    );
  }
}
