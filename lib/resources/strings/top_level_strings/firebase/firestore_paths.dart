class FirestorePath {
  static String users() => 'users/';
  static String user(String uid) => 'users/$uid/';
  static String houses() => 'houses/';
  static String house(String houseId) => 'houses/$houseId/';
  static String reports() => 'reports/';
  static String report(String reportId) => 'reports/$reportId/';
  static String tenancy() => 'tenancy/';
  static String tenancyById(String tenancyId) => 'tenancy/$tenancyId/';
  static String tenancyDocuments() => 'tenancy_documents/';
  static String tenancyDocument(String tenancyDocumentId) => 'tenancy_documents/$tenancyDocumentId/';
}

class FirestoreCollections {
  static const String users = 'users';
  static const String houses = 'houses';
  static const String reports = 'reports';
  static const String tenancy = 'tenancy';
  static const String tenancyDocuments = 'tenancy_documents';
}
