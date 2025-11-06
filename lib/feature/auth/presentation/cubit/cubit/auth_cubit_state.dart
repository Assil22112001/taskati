part of 'auth_cubit_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}
final class SaveUserSuccess extends AuthCubitState {}
final class SaveUserLoading extends AuthCubitState {}
final class SaveUserError extends AuthCubitState {}
