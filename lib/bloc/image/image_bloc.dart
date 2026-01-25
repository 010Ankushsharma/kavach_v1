import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kavach_v1/repository/image_repository.dart';
import 'package:meta/meta.dart';

import '../../models/CropDiseaseResult.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository repository;
  File? _selectedImage;

  ImageBloc(this.repository) : super(ImageInitial()) {
    on<PickFromCamera>(_pickFromCamera);
    on<PickFromGallery>(_pickFromGallery);
    on<DetectImage>(_detectImage);
    on<ClearImage>(_clearImage);
  }


  Future<void> _pickFromCamera(
      PickFromCamera event, Emitter<ImageState> emit) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _selectedImage = File(image.path);
      emit(ImageSelected(_selectedImage!));
    }
  }
  Future<void> _pickFromGallery(
      PickFromGallery event, Emitter<ImageState> emit) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _selectedImage = File(image.path);
      emit(ImageSelected(_selectedImage!));
    }
  }

  Future<void> _detectImage(
      DetectImage event, Emitter<ImageState> emit) async {
    if (_selectedImage == null) {
      emit(ImageError("No image found"));
      return;
    }

    emit(ImageLoading());
    try {
      final result =
      await repository.detectCropDisease(_selectedImage!);
      emit(ImageDetected(result));
    } catch (e) {
      emit(ImageError("Detection failed"));
    }
  }


  void _clearImage(ClearImage event, Emitter<ImageState> emit) {
    _selectedImage = null;
    emit(ImageInitial());
  }
}


