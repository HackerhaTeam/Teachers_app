part of 'image_upload_cubit.dart';

abstract class ImageUploadState {}

class ImageUploadInitial extends ImageUploadState {}

class ImageUploadLoading extends ImageUploadState {}

class ImageUploadSuccess extends ImageUploadState {
  final File file;
  ImageUploadSuccess(this.file);
}

class ImageUploadError extends ImageUploadState {
  final String message;
  ImageUploadError(this.message);
}
