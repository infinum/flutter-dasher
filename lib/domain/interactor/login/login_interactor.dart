import 'package:flutter_dasher/domain/data/user_data_holder.dart';
import 'package:flutter_dasher/domain/interactor/login/login_interactor_impl.dart';
import 'package:flutter_dasher/domain/repository/login_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_interactor.g.dart';

@riverpod
LoginInteractor loginInteractor(LoginInteractorRef ref) {
  return LoginInteractorImpl(ref.watch(loginRepositoryProvider), ref.watch(userDataHolderProvider));
}

abstract class LoginInteractor {
  Future<void> login();
}
