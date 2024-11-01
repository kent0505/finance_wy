import 'package:hive_flutter/hive_flutter.dart';

import '../models/money.dart';
import '../utils.dart';

String boxName = 'finance_wy_box';
String keyName = 'moneyList';
List<Money> moneyList = [];

Future<void> initHive() async {
  try {
    await Hive.initFlutter();
    // await Hive.deleteBoxFromDisk(boxName);
    Hive.registerAdapter(MoneyAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getMoneyList() async {
  try {
    final box = await Hive.openBox(boxName);
    List data = box.get(keyName) ?? [];
    moneyList = data.cast<Money>();
    logger(moneyList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateMoneyList() async {
  try {
    final box = await Hive.openBox(boxName);
    box.put(keyName, moneyList);
    moneyList = await box.get(keyName);
  } catch (e) {
    logger(e);
  }
}
