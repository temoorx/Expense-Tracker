import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/expense_data.dart';
import '../models/expense_item.dart';

class AddExpenseScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddExpenseScreen());
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  //delete expense
  void deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  //save new expense
  void onSave() {
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(ExpenseItem(
      title: _newNameofExpense.text,
      amount: double.parse(_amountofExpense.text),
      date: DateTime.now(),
    ));
    Navigator.of(context).pop();
  }

  final _newNameofExpense = TextEditingController();
  final _amountofExpense = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Center(
          child: Text(
            'Add Expense',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
          TextButton(
            onPressed: onSave,
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: TextField(
                  style: const TextStyle(fontSize: 20),
                  controller: _newNameofExpense,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Expanse Name',
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _amountofExpense,
                style:
                    const TextStyle(fontSize: 75, fontWeight: FontWeight.w700),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIconColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.attach_money,
                    size: 70,
                  ),
                ),
              ),
              Text(
                  'Today at ' '${DateTime.now().hour}:${DateTime.now().minute}')
            ],
          ),
        ),
      ),
    );
  }
}
