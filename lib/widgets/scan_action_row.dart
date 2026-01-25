import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/image/image_bloc.dart';
import 'action_circle_button.dart';

class ScanActionRow extends StatelessWidget {
  const ScanActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _offsetButton(
            context,
            icon: Icons.camera_alt,
            label: "Camera",
            event: PickFromCamera(),
          ),

          ActionCircleButton(
            icon: Icons.search,
            label: "Detect",
            isPrimary: true,
            onTap: () =>
                context.read<ImageBloc>().add(DetectImage()),
          ),

          _offsetButton(
            context,
            icon: Icons.photo_library,
            label: "Gallery",
            event: PickFromGallery(),
          ),
        ],
      ),
    );
  }

  Widget _offsetButton(
      BuildContext context, {
        required IconData icon,
        required String label,
        required ImageEvent event,
      }) {
    return Transform.translate(
      offset: const Offset(0, -20),
      child: ActionCircleButton(
        icon: icon,
        label: label,
        onTap: () => context.read<ImageBloc>().add(event),
      ),
    );
  }
}
