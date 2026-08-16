import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class ContactService {
  Future<bool> sendContactMessage({
    required String name,
    required String email,
    required String message,
  });
}

class Web3FormsContactService implements ContactService {
  final String accessKey;

  Web3FormsContactService({
    this.accessKey = '60e5b42c-5c5e-4bc6-87c3-f1210ca7e2d4',
  });

  @override
  Future<bool> sendContactMessage({
    required String name,
    required String email,
    required String message,
  }) async {
    try {
      final url = Uri.parse('https://api.web3forms.com/submit');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'access_key': accessKey,
          'name': name,
          'email': email,
          'message': message,
          'subject': 'New Portfolio Message from $name',
          'from_name': 'Portfolio Contact Form',
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['success'] == true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}

class MockContactService implements ContactService {
  @override
  Future<bool> sendContactMessage({
    required String name,
    required String email,
    required String message,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1200));
    return true;
  }
}
