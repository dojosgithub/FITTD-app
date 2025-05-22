import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileRequestModel {
  final String name;
  final String email;
  final XFile? profileImage;

  UpdateProfileRequestModel({
    required this.name,
    required this.email,
    this.profileImage,
  });

  Future<FormData> toFormData() async {
    final Map<String, dynamic> formDataMap = {
      'name': name,
      'email': email,
    };

    if (profileImage != null) {
      final file = await MultipartFile.fromFile(
        profileImage!.path,
        filename: profileImage!.name,
      );
      formDataMap['image'] = file;
    }

    return FormData.fromMap(formDataMap);
  }
}
