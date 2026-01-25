part of 'image_bloc.dart';

@immutable
sealed class ImageEvent {}

class PickFromCamera extends ImageEvent{}

class PickFromGallery extends ImageEvent{}

class DetectImage extends ImageEvent{}

class ClearImage extends ImageEvent {}