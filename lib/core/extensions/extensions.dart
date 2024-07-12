import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension VoteColorX on int {
  Color get color => switch (this) {
        == 0 => Colors.grey,
        > 0 && < 50 => Colors.red,
        >= 50 && < 70 => Colors.yellow,
        _ => Colors.green,
      };
}

extension StringX on String {
  String get dateFormat => isNotEmpty
      ? DateFormat.yMMMd().format(
          DateTime.parse(this),
        )
      : '';

  String get dateFormatLarge => isNotEmpty
      ? DateFormat.yMMMMd().format(
          DateTime.parse(this),
        )
      : '';
}
