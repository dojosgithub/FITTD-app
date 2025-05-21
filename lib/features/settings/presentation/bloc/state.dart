part of 'bloc.dart';

class SettingsState extends Equatable {
  final XFile? image;

  const SettingsState({required this.image});

  @override
  List<Object?> get props => [image];

  SettingsState copyWith({
    XFile? image,
    bool clearImage = false,
  }) {
    return SettingsState(
      image: clearImage ? null : (image ?? this.image),
    );
  }
}
