import 'package:logger/logger.dart';
import 'package:rent_it/models/house/house.dart';
import 'package:rent_it/models/notification/notification.dart';
import 'package:rent_it/models/tenancy/tenancy.dart';
import 'package:rent_it/services/top_level_services/firebase/firestore_database_services.dart';
import 'package:rent_it/services/top_level_services/firebase/firestore_services.dart';
import 'package:rent_it/services/top_level_services/firebase/realtime_db_services.dart';

Future<bool> inviteTenant(House house, String tenantEmail, int startDate, int endDate) async {
  try {
    final tenantId = await getUserByEmailAddress(tenantEmail);

    if (tenantId == null) {
      return false;
    }

    final tenancyId = getRandString(22);

    final tenancyObject = Tenancy(
      id: tenancyId,
      tenantId: tenantId,
      houseId: house.id,
      startDate: startDate,
      endDate: endDate,
      rentAmount: house.monthlyRent,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    final inviteTenantNotification = Notification(
      id: getRandString(22),
      userId: tenantId,
      type: NotificationType.invite,
      title: 'House Invitation',
      body: 'You have been invited to a house',
      houseId: house.id,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      tenancyId: tenancyId,
      reportId: '',
    );

    await setNotification(inviteTenantNotification);
    await setTenancy(tenancyObject);

    return true;
  } catch (error) {
    Logger().e(error);
    return false;
  }
}
