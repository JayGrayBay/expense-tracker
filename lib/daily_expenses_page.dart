//daily_expenses_page.dart
import 'package:flutter/material.dart';
import 'package:exp_tracker/home_page.dart';
import 'package:provider/provider.dart';

class DailyExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpensesModel>(
      builder: (context, expensesModel, child) {
        return ListView.builder(
          itemCount: expensesModel.expenses.length,
          itemBuilder: (context, index) {
            final expense = expensesModel.expenses[index];
            return ListTile(
              title: Text(expense.item),
              trailing: Text(expense.price.toString()),
            );
          },
        );
      },
    );
  }
}

