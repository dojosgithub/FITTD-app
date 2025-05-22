import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/features/profile/data/models/update_profile_request_model.dart';
import 'package:fitted/features/profile/domain/entities/profile_entities.dart';
import 'package:fitted/features/profile/domain/usecases/profile_usecase.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part "event.dart";
part 'state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase profileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final ImagePicker _picker = ImagePicker();

  ProfileBloc(
      {required this.profileUseCase, required this.updateProfileUseCase})
      : super(
          ProfileState(
            isLoading: true,
            isSuccess: false,
            profile: Profile(
              id: null,
              name: null,
              email: null,
              imageUrl: null,
              wishlist: null,
            ),
            image: null,
            firstName: TextEditingController(),
            lastName: TextEditingController(),
            emailName: TextEditingController(),
          ),
        ) {
    on<GetProfile>((event, emit) async {
      emit(state.copyWith(isLoading: true, isSuccess: false));
      final result = await profileUseCase();

      result.fold((failure) {
        log(failure.message.toString());
        emit(state.copyWith(isLoading: false));
      }, (sucess) {
        log(sucess.toString());

        emit(state.copyWith(
          isLoading: false,
          profile: sucess.profile,
          firstName: TextEditingController(text: sucess.profile!.name),
          emailName: TextEditingController(text: sucess.profile!.email),
        ));
      });
    });
    on<UpdateProfile>((event, emit) async {
      emit(state.copyWith(isLoading: true, isSuccess: false));
      final result = await updateProfileUseCase(
        UpdateProfileRequestModel(
          name: state.firstName.text,
          email: state.emailName.text,
          profileImage: state.image,
        ),
      );

      result.fold((failure) {
        log(failure.message.toString());
        emit(state.copyWith(isLoading: false));
      }, (sucess) {
        ToastUtil.showToast(message: "Profile Updated Sucessfully");
        add(ClearImage());
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          profile: sucess.profile,
          firstName: TextEditingController(text: sucess.profile!.name),
          emailName: TextEditingController(text: sucess.profile!.email),
        ));
      });
    });
    on<PickFromCamera>(_pickFromCamera);
    on<PickFromGallery>(_pickFromGallery);
    on<ClearImage>((event, emit) => emit(state.copyWith(clearImage: true)));
  }
  Future<void> _pickFromCamera(
      PickFromCamera event, Emitter<ProfileState> emit) async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(image: image));
    } else {}
  }

  Future<void> _pickFromGallery(
      PickFromGallery event, Emitter<ProfileState> emit) async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(image: image));
    } else {}
  }
}
