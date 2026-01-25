import 'package:flutter/material.dart';
import 'package:kavach_v1/widgets/community_detail.dart';

import '../constants/app_colors.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Communities',
          style: TextStyle(color: AppColors.accent),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[300]!, Colors.green[700]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildCommunityTile(
              context,
              'Agro Innovators Network',
              'Connect with fellow agricultural innovators',
            ),
            _buildCommunityTile(
              context,
              'Sustainable Farming Group',
              'Discuss and share sustainable farming practices',
            ),
            _buildCommunityTile(
              context,
              'Crop Protection Strategies',
              'Share tips and strategies for crop protection',
            ),
            _buildCommunityTile(
              context,
              'Organic Farming Enthusiasts',
              'Join discussions on organic farming techniques',
            ),
            _buildCommunityTile(
              context,
              'Advanced Irrigation Techniques',
              'Learn and share advanced irrigation methods',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityTile(
      BuildContext context,
      String communityName,
      String subtitle,
      ) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          Icons.group,
          color: Colors.green[700],
        ),
        title: Text(communityName),
        subtitle: Text(subtitle),
        contentPadding: const EdgeInsets.all(16.0),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CommunityDetailScreen(
                communityName: communityName,
              ),
            ),
          );
        },
      ),
    );
  }
}
