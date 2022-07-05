import 'package:flutter_dasher/domain/interactor/login/login_interactor.dart';
import 'package:flutter_dasher/domain/repository/login_repository.dart';

class LoginInteractorImpl implements LoginInteractor {
  LoginInteractorImpl(this._loginRepository);

  final LoginRepository _loginRepository;

  @override
  Future<void> login() async {
    await _loginRepository.login();
  }
}
