import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kavach_v1/constants/app_colors.dart';
import 'package:kavach_v1/screens/scan_result_screen.dart';
import 'package:kavach_v1/widgets/scan_action_row.dart';
import 'package:kavach_v1/widgets/scan_image_preview.dart';

import '../bloc/image/image_bloc.dart';
import '../widgets/feature_action_list.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
          title: const Text("Crop Scan"),
        centerTitle: true,
      ),

      body: BlocListener<ImageBloc, ImageState>(
        listener: (context, state) {
          if (state is ImageDetected) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ResultScreen(result: state.result),
              ),
            );
          }

          if (state is ImageError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 24),
                child: const Column(
                  children: [
                    SizedBox(height: 16),
                    ScanImagePreview(),
                    SizedBox(height: 24),
                    ScanActionRow(),
                    SizedBox(height: 24),
                    //ScanLoadingIndicator(),


                    FeatureActionList(),

                    SizedBox(height: 24),
                      ],
                    ),
              ),
    ),
    );
  }
}