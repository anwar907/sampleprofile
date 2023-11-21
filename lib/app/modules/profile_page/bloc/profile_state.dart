part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.status = GlobalSatus.initial,
    this.profileModels,
    this.errorMessage,
  });

  final GlobalSatus status;
  final UsersModel? profileModels;
  final String? errorMessage;

  ProfileState copyWith({
    GlobalSatus? status,
    UsersModel? profileModels,
    String? errorMessage,
  }) {
    return ProfileState(
      status: status ?? this.status,
      profileModels: profileModels ?? this.profileModels,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, profileModels, errorMessage];
}
