import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

import '../config/api_config.dart';

class GlobalReports {
  Report? _globalReport;

  Report? get globalReport => _globalReport;

  final Api api = Api(globalCasesAPI, headers);

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(api.url), headers: api.headers);

      final responseData = json.decode(response.body);

      responseData.forEach((value) {
        _globalReport = Report(
          totalCases: value['TotalCases'].toString(),
          newCases: value['NewCases'].toString(),
          activeCases: value['ActiveCases'].toString(),
          criticalCases: value['Serious_Critical'].toString(),
          recovered: value['TotalRecovered'].toString(),
          totalDeaths: value['TotalDeaths'].toString(),
        );
      });
    } catch (error) {
      throw error;
    }
  }
}
