import 'package:flutter/material.dart';
import 'package:kavach_v1/models/CropDiseaseResult.dart';


class ResultScreen extends StatelessWidget {
  final CropDiseaseResult result;

  const ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detection Result")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              result.disease,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Text(result.description),

            const SizedBox(height: 16),

            const Text(
              "Prevention",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text(result.prevention),
          ],
        ),
      ),
    );
  }
}
