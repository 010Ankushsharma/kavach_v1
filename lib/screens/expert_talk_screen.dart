import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ExpertTalkScreen extends StatelessWidget {
  const ExpertTalkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expert Talk'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green[100]!, Colors.green[300]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Volunteer for a Session',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Become a volunteer and contribute to expert sessions. Fill out the form to express your interest in helping.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to volunteer form
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        child: const Text('Volunteer Now'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.grey[100]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Upcoming Sessions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 8.0),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.event,
                                    color: Colors.green[700],
                                  ),
                                  title: Text('Session ${index + 1}'),
                                  subtitle: Text(
                                    'Place: ${_getLocation(index)}\nDate: ${_getDate(index)}\nTime: ${_getTime(index)}',
                                  ),
                                  trailing: const Icon(Icons.arrow_forward),
                                  onTap: () {
                                    // Handle session tap
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getLocation(int index) {
    const locations = [
      'Community Hall A',
      'Conference Room 1',
      'Local Library',
      'Tech Center Auditorium',
      'Greenhouse Meeting Room',
    ];
    return locations[index % locations.length];
  }

  String _getDate(int index) {
    const dates = [
      '2024-09-21',
      '2024-09-23',
      '2024-09-25',
      '2024-09-27',
      '2024-09-29',
    ];
    return dates[index % dates.length];
  }

  String _getTime(int index) {
    const times = [
      '10:00 AM',
      '02:00 PM',
      '11:00 AM',
      '03:00 PM',
      '01:00 PM',
    ];
    return times[index % times.length];
  }
}
