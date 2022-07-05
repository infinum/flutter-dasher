import 'package:flutter_dasher/domain/interactor/login/login_interactor.dart';
import 'package:flutter_dasher/domain/interactor/login/login_interactor_impl.dart';
import 'package:get_it/get_it.dart';

void injectDependencies(GetIt getIt) {
  getIt.registerFactory<LoginInteractor>(
    () => LoginInteractorImpl(
      getIt.get(),
    ),
  );
}
