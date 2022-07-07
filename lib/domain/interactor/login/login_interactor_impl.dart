import 'package:flutter_dasher/domain/data/user_data_holder.dart';
import 'package:flutter_dasher/domain/interactor/login/login_interactor.dart';
import 'package:flutter_dasher/domain/repository/login_repository.dart';

class LoginInteractorImpl implements LoginInteractor {
  LoginInteractorImpl(
    this._loginRepository,
    this._userDataHolder,
  );

  final LoginRepository _loginRepository;
  final UserDataHolder _userDataHolder;

  @override
  Future<void> login() async {
    final user = await _loginRepository.login();

    _userDataHolder.user = user;
  }
}
