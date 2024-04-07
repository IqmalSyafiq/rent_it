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

    final inviteTenantNotification = Notification(
      id: getRandString(22),
      userId: tenantId,
      type: NotificationType.invite,
      title: 'House Invitation',
      body: 'You have been invited to a house',
      houseId: house.id,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      reportId: '',
    );

    final tenancyObject = Tenancy(
      id: getRandString(22),
      tenantId: tenantId,
      houseId: house.id,
      startDate: startDate,
      endDate: endDate,
      rentAmount: house.monthlyRent,
    );

    await setNotification(inviteTenantNotification);
    await setTenancy(tenancyObject);

    return true;
  } catch (error) {
    Logger().e(error);
    return false;
  }
}


//! create tenancy object

    // @JsonKey(name: 'id') required String id,
    // @JsonKey(name: 'tenant_id') required String tenantId,
    // @JsonKey(name: 'house_id') required String houseId,
    // @JsonKey(name: 'start_date') required int startDate,
    // @JsonKey(name: 'end_date') required int endDate,
    // @JsonKey(name: 'rent_amount') required num rentAmount,