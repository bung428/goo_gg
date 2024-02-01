import 'package:rxdart/rxdart.dart';

class DateTimeUtil {
  bool isWithinRange(DateTime start, DateTime end) {
    final now = DateTime.now();
    return (_daysBetween(start, now) >= 0 && _daysBetween(now, end) >= 0);
  }

  int _daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  (bool, int) compareDateByMinutes(DateTime time, int gap) {
    final now = DateTime.now();
    final days = now.difference(time).inDays;
    final hours = now.difference(time).inHours;
    final minutes = now.difference(time).inMinutes;

    if (days > 0) {
      return (true, -1);
    } else if (hours > 0) {
      return (true, -1);
    } else {
      final result = (minutes >= gap ? true : false, minutes - gap);
      return result;
    }
  }

  (RefreshState, String) calculateDaysDifference(DateTime target) {
    final now = DateTime.now();
    final difference = target.difference(now).inDays;
    final absDiff = difference.abs();
    final state = absDiff > 0 ? RefreshState.possible : RefreshState.impossible;
    final diffDesc = absDiff >= 60
        ? 'same'
        : absDiff < 60 && absDiff >= 30
          ? '한달 전'
          : '$absDiff일 전';
    return (state, diffDesc);
  }
}

enum RefreshState {
  possible,
  impossible,
}