import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../data/models/models.dart';

import '../widgets/widgets.dart';

class CountryCard extends StatelessWidget {
  final Report report;

  CountryCard({required this.report});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: () async {
        return _buildCaseDetailsBottomSheet(context: context, report: report);
      },
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: FadeInImage(
          placeholder: const AssetImage(
            'assets/country_flags/default.png',
          ),
          fit: BoxFit.contain,
          image: AssetImage(report.image!),
          imageErrorBuilder: (context, object, stacktrace) {
            return Image.asset('assets/country_flags/default.png');
          },
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          report.country!,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'Total : ${NumberFormat.compact().format(double.parse(report.totalCases))}',
                style: const TextStyle(fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                'Active : ${NumberFormat.compact().format(double.parse(report.activeCases))}',
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _buildCaseDetailsBottomSheet({
    required BuildContext context,
    required Report report,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      report.country!,
                      style: const TextStyle(fontSize: 22, letterSpacing: 1),
                    ),
                  ),
                  DetailCard(
                    label: 'Total',
                    data: NumberFormat.compact().format(
                      double.parse(
                        report.totalCases,
                      ),
                    ),
                    color: Colors.lime,
                  ),
                  DetailCard(
                    label: 'New',
                    data: NumberFormat.compact().format(
                      double.parse(
                        report.newCases,
                      ),
                    ),
                    color: Colors.pink[400],
                  ),
                  DetailCard(
                    label: 'Active',
                    data: NumberFormat.compact().format(
                      double.parse(
                        report.activeCases,
                      ),
                    ),
                    color: Colors.lightBlue,
                  ),
                  DetailCard(
                    label: 'Critical',
                    data: NumberFormat.compact().format(
                      double.parse(
                        report.criticalCases,
                      ),
                    ),
                    color: Colors.amber,
                  ),
                  DetailCard(
                    label: 'Recovered',
                    data: NumberFormat.compact().format(
                      double.parse(
                        report.recovered,
                      ),
                    ),
                    color: Colors.lightGreen,
                  ),
                  DetailCard(
                    label: 'Deaths',
                    data: NumberFormat.compact().format(
                      double.parse(
                        report.totalDeaths,
                      ),
                    ),
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
