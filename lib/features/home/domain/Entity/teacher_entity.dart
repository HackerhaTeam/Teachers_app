import 'package:equatable/equatable.dart';
import 'package:teacher_hackerha/features/home/data/models/image_model.dart';

// ignore: must_be_immutable
class TeacherEntity extends Equatable {
    int id;
    String name;
    dynamic rate;
    ImageModel? image;
    DateTime createdAt;
    int? reviewsCount;
    int? studentsCount;
    int? coursesCount;

    TeacherEntity({
        required this.id,
        required this.name,
        required this.rate,
        required this.image,
        required this.createdAt,
        required this.reviewsCount,
        required this.studentsCount,
        required this.coursesCount,
    });
    
      @override
    
      List<Object?> get props => [id,name,];

   
}