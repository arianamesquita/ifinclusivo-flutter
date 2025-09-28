import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;


String formatTimeAgo(DateTime date) {
  return timeago.format(date, locale: 'pt_BR');
}

class DateFormatUtil {
  static String formatToBrazilianDate(DateTime date) {
    return DateFormat('dd/MM/yyyy', 'pt_BR').format(date);
  }

  static String formatMessageTimestamp(DateTime date) {
    const Map<int, String> weekDays = {
      1: 'segunda',
      2: 'terça',
      3: 'quarta',
      4: 'quinta',
      5: 'sexta',
      6: 'sábado',
      7: 'domingo',
    };
    final day = weekDays[date.weekday] ?? DateFormat.E('pt_BR').format(date);
    final time = DateFormat('HH:mm').format(date);
    return '$day - $time';
  }
}


class TimeAgoUtil {
  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d';
    } else {
      return DateFormatUtil.formatToBrazilianDate(dateTime);
    }
  }
}
