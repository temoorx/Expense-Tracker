import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ExpenseData(),
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.theme,
              title: 'Expense Tracker',
              home: const HomeScreen(),
            ));
  }
}
