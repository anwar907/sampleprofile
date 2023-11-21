part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  const ProfileEvent({this.id});

  final int? id;

  @override
  List<Object?> get props => [id];
}
