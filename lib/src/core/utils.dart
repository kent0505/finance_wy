import 'dart:developer' as developer;

import 'package:finance_wy/src/core/db/db.dart';
import 'package:finance_wy/src/core/models/money.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String timestampToString(int timestamp) {
  // timestamp to 22.06.2000
  try {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String dateToString(DateTime date) {
  // DateTime to 22.06.2000
  try {
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String timeToString(DateTime time) {
  // DateTime to 22:00
  try {
    return DateFormat('HH:mm').format(time);
  } catch (e) {
    return 'Error';
  }
}

DateTime stringToDate(String date) {
  // 22.06.2000 to DateTime
  try {
    return DateFormat('dd.MM.yyyy').parse(date);
  } catch (e) {
    return DateTime.now();
  }
}

String formatNumber(int number) {
  return NumberFormat('#,###').format(number);
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

bool getButtonActive(List<TextEditingController> controllers) {
  for (TextEditingController controller in controllers) {
    if (controller.text.isEmpty) return false;
  }
  return true;
}

void logger(Object message) {
  try {
    developer.log(message.toString());
  } catch (e) {
    debugPrint(e.toString());
  }
}

void precacheImages(BuildContext context) {
  List<String> imageAssets = [
    'assets/images/onboard1.png',
    'assets/images/onboard2.png'
  ];
  try {
    for (String assets in imageAssets) {
      precacheImage(AssetImage(assets), context);
    }
  } catch (e) {
    logger(e);
  }
}

String getCategoryAsset(String cat) {
  if (cat == 'Salary') return 'assets/cat1.svg';
  if (cat == 'Food') return 'assets/cat1.svg';
  if (cat == 'Transport') return 'assets/cat2.svg';
  if (cat == 'Rent') return 'assets/cat2.svg';
  if (cat == 'Business') return 'assets/cat3.svg';
  if (cat == 'Rest') return 'assets/cat3.svg';
  if (cat == 'Procurement') return 'assets/cat4.svg';
  if (cat == 'Freelance') return 'assets/cat4.svg';
  if (cat == 'Investment') return 'assets/cat5.svg';
  if (cat == 'Passive') return 'assets/cat5.svg';
  if (cat == 'Royalty') return 'assets/cat5.svg';
  if (cat == 'Dividents') return 'assets/cat5.svg';
  return 'assets/cat1.svg';
}

int totalIncomes = 0;
int totalExpenses = 0;

void calculateMoney() {
  totalIncomes = 0;
  totalExpenses = 0;
  for (Money money in moneyList) {
    if (money.income) {
      totalIncomes += money.amount;
    } else {
      totalExpenses += money.amount;
    }
  }
}

String getWeekdayAbbreviation() {
  DateTime today = DateTime.now();
  List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  return weekdays[today.weekday - 1];
}

// int getMoneyByIndex(int index, bool income) {
//   if (index == 1) {
//     int incomes = 0;
//     int expenses = 0;
//     DateTime today = DateTime.now();
//     List<Money> todaysMoneys = [];
//     for (Money money in moneyList) {
//       DateTime date = DateTime.fromMillisecondsSinceEpoch(money.id * 1000);
//       if (date.year == today.year &&
//           date.month == today.month &&
//           date.day == today.day) {
//         todaysMoneys.add(money);
//       }
//     }
//     for (Money money in todaysMoneys) {
//       if (money.income) {
//         incomes += money.amount;
//       } else {
//         expenses += money.amount;
//       }
//     }
//     return income ? incomes : expenses;
//   } else if (index == 2) {
//   } else {}
// }
