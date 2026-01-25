

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:kavach_v1/models/CropDiseaseResult.dart';

class ImageRepository {
  static const _apiKey="AIzaSyAXMKeXhU1O3jcVGi7DWe3NWGNTexEvMAw";

  Future<CropDiseaseResult> detectCropDisease(File image) async{
    final bytes = await image.readAsBytes();
    final base64Image = base64Encode(bytes);
    final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/"
          "gemini-2.0-flash:generateContent?key=$_apiKey",
    );



    final prompt="""
    You are an agriculture expert.
Analyze the crop image and respond ONLY in JSON.

{
 "disease": "",
 "description": "",
 "prevention": ""
}
""";

    final response= await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt},
              {
                "inlineData": {
                  "mimeType": "image/jpeg",
                  "data": base64Image
                }
              }
            ]
          }
        ]
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Gemini API failed: ${response.body}");
    }

    final body = jsonDecode(response.body);

    final rawText =
    body['candidates'][0]['content']['parts'][0]['text'];

    // 🔥 CLEAN THE RESPONSE BEFORE JSON PARSE
    final cleanJson = _extractJson(rawText);

    final jsonMap = jsonDecode(cleanJson);

    return CropDiseaseResult.fromJson(jsonMap);
  }

  /// Removes ```json, text, or noise from Gemini output
  String _extractJson(String text) {
    final start = text.indexOf('{');
    final end = text.lastIndexOf('}');
    if (start == -1 || end == -1) {
      throw Exception("Invalid JSON from Gemini");
    }
    return text.substring(start, end + 1);
  }
}