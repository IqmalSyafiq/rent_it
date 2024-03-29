class RealtimeDatabasePaths {
  static const String notifications = '/notifications/';
  static const String users = '/users/';
}

class RealtimeDatabaseRefs {
  String notifications(String uid) => 'users/$uid/notifications';
  String notifcation(String uid, String notificationId) => 'users/$uid/notifications/$notificationId';
}
