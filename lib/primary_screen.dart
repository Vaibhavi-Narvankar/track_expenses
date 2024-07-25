import 'package:flutter/material.dart';
import 'package:track_expenses/add_new_expense.dart';
import 'package:track_expenses/chart.dart';
import 'package:track_expenses/expenses_list.dart';

import 'package:track_expenses/model/expense_model.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({super.key});
  @override
  State<PrimaryScreen> createState() {
    return _PrimaryScreenState();
  }
}

class _PrimaryScreenState extends State<PrimaryScreen> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
        title: "mcd",
        amount: 1000,
        date: DateTime.now(),
        category: Category.food),
    ExpenseModel(
        title: "Bill",
        amount: 5000,
        date: DateTime.now(),
        category: Category.household),
  ];

  void _openAddExpenseModel() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return AddNewExpense(onAddExpense: _addExpenses);
        });
  }

  void _addExpenses(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpenses(ExpenseModel expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);

    Widget mainContent = const Center(
      child: Text("No Expense Found!"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpenses,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Track Expense"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseModel, icon: const Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ]),
      ),
    );
  }
}
