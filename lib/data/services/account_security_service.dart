
abstract class AccountSecurityService {
  Future<bool> updatePassword(
      Map<String, dynamic>updatePaswwordRequest);

  Future<void> deleteAccount();
}