import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_upload_state.dart';

class ImageUploadCubit extends Cubit<ImageUploadState> {
  ImageUploadCubit() : super(ImageUploadInitial());

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      emit(ImageUploadLoading());
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        emit(ImageUploadSuccess(File(pickedFile.path)));
      } else {
        emit(ImageUploadInitial());
      }
    } catch (e) {
      emit(ImageUploadError("فشل رفع الصورة"));
    }
  }

  void removeImage() {
    emit(ImageUploadInitial());
  }
}
