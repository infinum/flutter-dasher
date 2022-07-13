import 'package:flutter_dasher/domain/interactor/login/login_interactor.dart';
import 'package:flutter_dasher/ui/common/bits/request_provider/request_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginRequestPresenter = ChangeNotifierProvider.autoDispose<LoginRequestPresenter>(
  (ref) => LoginRequestPresenter(GetIt.instance.get()),
);

class LoginRequestPresenter extends RequestProvider<void> {
  LoginRequestPresenter(this._loginInteractor);

  final LoginInteractor _loginInteractor;

  void onLoginClicked() {
    executeRequest(requestBuilder: () => _loginInteractor.login());
  }
}
