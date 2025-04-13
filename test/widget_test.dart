import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  test("test api", () => gemini());
}

void gemini() async {
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
            {"text": "How does AI work?"},
          ],
        },
      ],
    }),
    headers: {'Content-Type': 'application/json'},
  );
  final data = jsonDecode(response.body);
  print(data["candidates"][0]["content"]["parts"][0]["text"]);
}


// curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$GEMINI_API_KEY" \
//   -H 'Content-Type: application/json' \
//   -X POST \
//   -d '{
    // "contents": [
    //   {
    //     "parts": [
    //       {
    //         "text": "How does AI work?"
    //       }
    //     ]
    //   }
    // ]
//   }'