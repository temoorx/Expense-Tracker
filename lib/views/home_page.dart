import 'package:expense_tracker/widgets/expense_summary.dart';
import 'package:expense_tracker/widgets/expense_tile.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_expense_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //add new expense
  void addNewExpense() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AddExpenseScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            'Expense',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: addNewExpense,
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<ExpenseData>(
            builder: (context, value, child) => ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    //expense summary
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child:
                          ExpenseSummary(startOfWeek: value.stateOfWeekData()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //expense list
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.getAllExpenseList().length,
                        itemBuilder: (context, index) => ExpenseTile(
                              title: value.getAllExpenseList()[index].title,
                              amount: value
                                  .getAllExpenseList()[index]
                                  .amount
                                  .toString(),
                              dateTime: value.getAllExpenseList()[index].date,
                              deleteTapped: (p0) => value.deleteExpense(
                                  value.getAllExpenseList()[index]),
                            )),
                  ],
                )),
      ),
    );
  }
}
