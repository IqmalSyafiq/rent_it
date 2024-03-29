import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
