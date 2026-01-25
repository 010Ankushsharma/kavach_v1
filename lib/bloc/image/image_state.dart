part of 'image_bloc.dart';

@immutable
sealed class ImageState {}

final class ImageInitial extends ImageState {}

class ImageSelected extends ImageState{
  final File image;
  ImageSelected(this.image);
}

class ImageLoading extends ImageState {}

class ImageDetected extends ImageState {
  final CropDiseaseResult result;
  ImageDetected(this.result);
}

class ImageError extends ImageState {
  final String message;
  ImageError(this.message);
}


