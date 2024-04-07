import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rent_it/shared/app_snackbar.dart';

Future<void> logout() async {
  await FirebaseAuth.instance.signOut();
}

String timeAgo(int milliSecondsSinceEpoch) {
  final DateTime date = DateTime.fromMillisecondsSinceEpoch(milliSecondsSinceEpoch);
  final DateTime now = DateTime.now();
  final Duration difference = now.difference(date);

  if (difference.inDays > 7) {
    return '${date.day}/${date.month}/${date.year}';
  } else if (difference.inDays > 1) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays == 1) {
    return 'Yesterday';
  } else if (difference.inHours > 1) {
    return '${difference.inHours} hours ago';
  } else if (difference.inHours == 1) {
    return 'An hour ago';
  } else if (difference.inMinutes > 1) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inMinutes == 1) {
    return 'A minute ago';
  } else {
    return 'Just now';
  }
}

void showErrorSnackbar(BuildContext context, String message) {
  final snackBar = appSnackBar(context, message: message, error: true);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

String formatMillisecondsSinceEpoch(int millisecondsSinceEpoch) {
  final DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  final DateFormat formatter = DateFormat('dd - MMMM - yyyy');
  final String formattedDate = formatter.format(date);
  return formattedDate;
}

Duration calculateDateDifference(int startMillisecondsSinceEpoch, int endMillisecondsSinceEpoch) {
  final DateTime startDate = DateTime.fromMillisecondsSinceEpoch(startMillisecondsSinceEpoch);
  final DateTime endDate = DateTime.fromMillisecondsSinceEpoch(endMillisecondsSinceEpoch);
  return endDate.difference(startDate);
}

String getDateDifferenceInYearsMonthsDays(int startMillisecondsSinceEpoch, int endMillisecondsSinceEpoch) {
  Duration difference = calculateDateDifference(startMillisecondsSinceEpoch, endMillisecondsSinceEpoch);
  int years = difference.inDays ~/ 365;
  int months = (difference.inDays % 365) ~/ 30;
  int days = (difference.inDays % 365) % 30;

  String result = '';
  if (years > 0) result += '$years year${years > 1 ? 's' : ''} ';
  if (months > 0) result += '$months month${months > 1 ? 's' : ''} ';
  if (days > 0) result += '$days day${days > 1 ? 's' : ''}';

  return result.trim();
}
