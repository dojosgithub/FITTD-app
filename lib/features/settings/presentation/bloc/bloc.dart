import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'state.dart';
part 'event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ImagePicker _picker = ImagePicker();

  SettingsBloc() : super(SettingsState(image: null)) {
    on<PickFromCamera>(_pickFromCamera);
    on<PickFromGallery>(_pickFromGallery);
    on<ClearImage>((event, emit) => emit(state.copyWith(clearImage: true)));
  }

  Future<void> _pickFromCamera(
      PickFromCamera event, Emitter<SettingsState> emit) async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(image: image));
    } else {}
  }

  Future<void> _pickFromGallery(
      PickFromGallery event, Emitter<SettingsState> emit) async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(image: image));
    } else {}
  }
}
