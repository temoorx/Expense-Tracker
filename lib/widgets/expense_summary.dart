import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/helpers/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/bar graph/bar_graph.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenseSummary({super.key, required this.startOfWeek});

  double calculateMax(
      ExpenseData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday) {
    double? max = 100;

    List<double> values = [
      value.calculateDailyExpenseSumary()[sunday] ?? 0,
      value.calculateDailyExpenseSumary()[monday] ?? 0,
      value.calculateDailyExpenseSumary()[tuesday] ?? 0,
      value.calculateDailyExpenseSumary()[wednesday] ?? 0,
      value.calculateDailyExpenseSumary()[thursday] ?? 0,
      value.calculateDailyExpenseSumary()[friday] ?? 0,
      value.calculateDailyExpenseSumary()[saturday] ?? 0,
    ];
    values.sort();
    max = values.last * 1.1;
    return max == 0 ? 100 : max;
  }

  //calculate the week total
  String calculateWeektotal(
      ExpenseData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday) {
    List<double> values = [
      value.calculateDailyExpenseSumary()[sunday] ?? 0,
      value.calculateDailyExpenseSumary()[monday] ?? 0,
      value.calculateDailyExpenseSumary()[tuesday] ?? 0,
      value.calculateDailyExpenseSumary()[wednesday] ?? 0,
      value.calculateDailyExpenseSumary()[thursday] ?? 0,
      value.calculateDailyExpenseSumary()[friday] ?? 0,
      value.calculateDailyExpenseSumary()[saturday] ?? 0,
    ];
    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    //get yyyy-mm-dd for each day of the week

    final String sunday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 0)));
    final String monday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));
    final String tuesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 2)));
    final String wednesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 3)));
    final String thursday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 4)));
    final String friday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 5)));
    final String saturday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => Column(
        children: [
          Column(
            children: [
              const Text(
                'Spent this week',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
              Text(
                '\$${calculateWeektotal(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday)}',
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              child: MyBarGraph(
                  maxY: calculateMax(value, sunday, monday, tuesday, wednesday,
                      thursday, friday, saturday),
                  sunAmount: value.calculateDailyExpenseSumary()[sunday] ?? 0,
                  monAmount: value.calculateDailyExpenseSumary()[monday] ?? 0,
                  tueAmount: value.calculateDailyExpenseSumary()[tuesday] ?? 0,
                  wedAmount:
                      value.calculateDailyExpenseSumary()[wednesday] ?? 0,
                  thuAmount: value.calculateDailyExpenseSumary()[thursday] ?? 0,
                  friAmount: value.calculateDailyExpenseSumary()[friday] ?? 0,
                  satAmount:
                      value.calculateDailyExpenseSumary()[saturday] ?? 0),
            ),
          ),
        ],
      ),
    );
  }
}
