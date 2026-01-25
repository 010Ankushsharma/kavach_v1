import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Plans'),
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[50]!, Colors.green[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildSubscriptionCard(
                title: 'Basic Plan',
                price: '\$5/month',
                features: const [
                  'Daily Access to Crop Tips',
                  'Weekly Weather Updates',
                  'Access to Community Forum',
                ],
                color: Colors.green[400]!,
                onSubscribe: () {
                  // Handle subscription logic here
                },
              ),
              const SizedBox(height: 16.0),
              _buildSubscriptionCard(
                title: 'Standard Plan',
                price: '\$10/month',
                features: const [
                  'All Basic Plan Features',
                  'Personalized Crop Recommendations',
                  'Monthly Expert Q&A Sessions',
                ],
                color: Colors.green[500]!,
                onSubscribe: () {
                  // Handle subscription logic here
                },
              ),
              const SizedBox(height: 16.0),
              _buildSubscriptionCard(
                title: 'Premium Plan',
                price: '\$20/month',
                features: const [
                  'All Standard Plan Features',
                  'One-on-One Guidance with Experts',
                  'Exclusive Webinars and Workshops',
                  'Priority Support',
                ],
                color: Colors.green[600]!,
                onSubscribe: () {
                  // Handle subscription logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionCard({
    required String title,
    required String price,
    required List<String> features,
    required Color color,
    required VoidCallback onSubscribe,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withValues(alpha: 0.8), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              ...features.map((feature) => Text(
                '• $feature',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              )),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: onSubscribe,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Subscribe Now',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
