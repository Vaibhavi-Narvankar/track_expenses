import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category {
  food,
  work,
  travel,
  shopping,
  household,
  entertainment,
  personalLoan,
  rent,
  personalCare,
  medicalCare,
  others
}

const categoryIcons = {
  Category.food: Icons.food_bank_sharp,
  Category.work: Icons.cases,
  Category.travel: Icons.travel_explore,
  Category.shopping: Icons.shopping_cart,
  Category.household: Icons.house,
  Category.entertainment: Icons.movie_creation_outlined,
  Category.personalLoan: Icons.currency_rupee,
  Category.rent: Icons.home_work,
  Category.personalCare: Icons.person,
  Category.medicalCare: Icons.local_hospital,
  Category.others: Icons.more
};

class ExpenseModel {
  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseChart {
  ExpenseChart({required this.category, required this.expenses});

  ExpenseChart.forCategory(List<ExpenseModel> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<ExpenseModel> expenses;

  double get totalAmount {
    double sum = 0;

    for (final i in expenses) {
      sum += i.amount;
    }
    return sum;
  }
}
