import 'package:http/http.dart' as http;
import 'dart:convert';

class Gemini {
  static Future<String> generateContent({required String prompt}) async {
    final String apiKey = "AIzaSyBwbG8_7PQyfEkgZnY8FUajiIvQcATv6zA";
    final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey",
    );
    final response = await http.post(
      url,
      body: json.encode({
        "contents": [
          {
            "parts": [
              {"text": prompt},
            ],
          },
        ],
      }),
      headers: {'Content-Type': 'application/json'},
    );
    final data = jsonDecode(response.body);
    return data["candidates"][0]["content"]["parts"][0]["text"] as String;
  }
}
