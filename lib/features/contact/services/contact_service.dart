abstract class ContactService {
  Future<bool> sendContactMessage({
    required String name,
    required String email,
    required String message,
  });
}

class MockContactService implements ContactService {
  @override
  Future<bool> sendContactMessage({
    required String name,
    required String email,
    required String message,
  }) async {
    // Simulate backend API latency
    await Future.delayed(const Duration(milliseconds: 1200));
    return true;
  }
}
