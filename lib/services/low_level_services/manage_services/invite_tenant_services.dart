import 'package:logger/logger.dart';
import 'package:rent_it/models/notification/notification.dart';
import 'package:rent_it/services/top_level_services/firebase/firestore_database_services.dart';
import 'package:rent_it/services/top_level_services/firebase/firestore_services.dart';
import 'package:rent_it/services/top_level_services/firebase/realtime_db_services.dart';

Future<bool> inviteTenant(String houseId, String tenantEmail) async {
  try {
    final userId = await getUserByEmailAddress(tenantEmail);

    if (userId == null) {
      return false;
    }

    final inviteTenantNotification = Notification(
      id: getRandString(22),
      userId: userId,
      type: NotificationType.invite,
      title: 'House Invitation',
      body: 'You have been invited to a house',
      houseId: houseId,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      reportId: '',
    );

    await setNotification(inviteTenantNotification);

    return true;
  } catch (error) {
    Logger().e(error);
    return false;
  }
}
