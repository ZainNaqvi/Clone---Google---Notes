import 'dart:math';

String generateRandomKey() {
  int randomNumber = Random().nextInt(10000);
  String randomString = DateTime.now().millisecondsSinceEpoch.toRadixString(36);
  return '$randomString-$randomNumber';
}
