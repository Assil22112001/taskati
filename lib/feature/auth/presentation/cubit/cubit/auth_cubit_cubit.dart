import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskati/feature/auth/data/models/user_model.dart';
import 'package:taskati/feature/auth/data/repo/auth_repo.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit() : super(AuthCubitInitial());

  

  saveUserData(UserModel user) async {
    emit(SaveUserLoading());
    final repo = AuthRepo();
final response = await repo.saveUserData(user);

    if (response) {
      emit(SaveUserSuccess());
    } else {
      emit(SaveUserError());
    }
  }
}
