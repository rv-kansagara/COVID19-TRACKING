import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'data/providers/providers.dart';

import 'ui/theme/theme.dart';

import 'ui/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
}

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    final _globalReports = GlobalReports();
    final _countriesReports = CountriesReports();

    return MultiProvider(
      providers: [
        Provider.value(value: _globalReports),
        Provider.value(value: _countriesReports),
      ],
      builder: (context, _) {
        return MaterialApp(
          title: 'COVID19 TRACKING',
          theme: theme,
          home: FutureBuilder(
            future: Future.wait([
              _globalReports.getData(),
              _countriesReports.getData(),
            ]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SplashScreen();
              } else if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.hasError ? SplashScreen() : HomeScreen();
              } else {
                return HomeScreen();
              }
            },
          ),
        );
      },
    );
  }
}
