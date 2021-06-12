import 'package:covid19_tracking/data/models/report.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../data/providers/countries_reports.dart';

import '../widgets/widgets.dart';

class AllCountriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountriesReports>(
      builder: (context, reports, _) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.centerRight,
              child: IconButton(
                splashRadius: 24,
                tooltip: 'Search',
                icon: const Icon(
                  Icons.search_rounded,
                  size: 34,
                ),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: _CountrySearch(reports: reports),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                itemCount: reports.countriesReports.length,
                itemBuilder: (context, index) => NeumorphicContainer(
                  margin: 10,
                  child: CountryCard(
                    report: reports.countriesReports.elementAt(index),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CountrySearch extends SearchDelegate<CountriesReports> {
  final CountriesReports reports;

  _CountrySearch({required this.reports});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        splashRadius: 20,
        icon: Icon(Icons.clear_rounded),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      icon: Icon(Icons.arrow_back_rounded),
      onPressed: () => close(context, CountriesReports()),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Report> _result = reports.countriesReports
        .where((element) => element.country!.toLowerCase().contains(query))
        .toList();
    return ListView.builder(
      itemCount: _result.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: CountryCard(
            report: _result.elementAt(index),
          ),
        );
      },
    );
  }
}
