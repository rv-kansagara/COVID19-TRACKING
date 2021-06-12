import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

import '../config/api_config.dart';

class CountriesReports {
  List<Report> _countriesReports = [];

  List<Report> get countriesReports => [..._countriesReports];

  final Api api = Api(allCountriesCasesAPI, headers);

  Future getData() async {
    try {
      _countriesReports.clear();
      final response = await http.get(Uri.parse(api.url), headers: api.headers);

      final responseData = json.decode(response.body);

      responseData.forEach((value) {
        final Report _report = Report(
          country: value['Country'],
          totalCases: value['TotalCases'].toString(),
          newCases: value['NewCases'].toString(),
          activeCases: value['ActiveCases'].toString(),
          criticalCases: value['Serious_Critical'].toString(),
          recovered: value['TotalRecovered'].toString(),
          totalDeaths: value['TotalDeaths'].toString(),
          image:
              'assets/country_flags/${value['Country'].toString().toLowerCase()}.png',
        );
        _countriesReports.add(_report);
      });
    } catch (error) {
      throw error;
    }
  }
}
