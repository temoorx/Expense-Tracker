import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/material.dart';

import '../helpers/date_time_helper.dart';

class ExpenseData extends ChangeNotifier {
  //list of all expenses

  List<ExpenseItem> overallExpenselist = [];

  //get expense list

  List<ExpenseItem> getAllExpenseList() {
    return overallExpenselist;
  }

  //add new expense

  void addNewExpense(ExpenseItem newExpense) {
    overallExpenselist.add(newExpense);
    notifyListeners();
  }

  //delete expense
  void deleteExpense(ExpenseItem expense) {
    overallExpenselist.remove(expense);
    notifyListeners();
  }

  //get weekday from date object
  String getWeekday(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  //get the data for the start of the week (sunday)

  DateTime stateOfWeekData() {
    DateTime? startOfWeek;

    //get  todsays date

    DateTime today = DateTime.now();
    //go back to find sunday
    for (int i = 0; i < 7; i++) {
      if (getWeekday(today.subtract(Duration(days: i))) == 'Sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  Map<String, double> calculateDailyExpenseSumary() {
    Map<String, double> dailyExpenseSummary = {};
    for (var expense in overallExpenselist) {
      String date = convertDateTimeToString(expense.date);
      double amount = double.parse(expense.amount.toString());
      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = amount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}
