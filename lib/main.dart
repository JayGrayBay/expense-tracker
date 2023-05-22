// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'daily_expenses_page.dart';
import 'weekly_expenses_page.dart';
import 'monthly_expenses_page.dart';


void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExpensesModel>(
      create: (context) => ExpensesModel(),
      child: MaterialApp(
        title: 'Expenses App',
        home: HomePage(),
      ),
    );
  }
}


