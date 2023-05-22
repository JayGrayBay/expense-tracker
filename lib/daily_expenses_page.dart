//daily_expenses_page.dart
import 'package:flutter/material.dart';
import 'package:exp_tracker/home_page.dart';
import 'package:provider/provider.dart';

class DailyExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final expenses = Provider.of<ExpensesModel>(context).expenses.where((e) {
      final expenseDate = e.date;
      return expenseDate.year == today.year && expenseDate.month == today.month && expenseDate.day == today.day;
    }).toList();
    final total = expenses.fold(0.0, (sum, e) => sum + e.price);
    return Column(
      children: [
        Text('Expenses Today', style: Theme.of(context).textTheme.headline4),
        Text('Total: \$${total.toStringAsFixed(2)}', style: Theme.of(context).textTheme.headline5),
        Expanded(
          child: ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense = expenses[index];
              return ListTile(
                title: Text(expense.item),
                trailing: Text('\$${expense.price.toStringAsFixed(2)}'),
              );
            },
          ),
        ),
      ],
    );
  }
}

