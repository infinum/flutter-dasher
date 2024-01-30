import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_manager.g.dart';

@Riverpod(keepAlive: true)
class AuthenticationManager extends _$AuthenticationManager {
  @override
  Authentication build() {
    return const AuthenticationUnauthenticated();
  }

  void onAuthenticated({required String accessToken}) {
    state = AuthenticationAuthenticated(accessToken: accessToken);
  }

  void onUnauthenticated() {
    state = const AuthenticationUnauthenticated();
  }
}

sealed class Authentication {}

class AuthenticationUnauthenticated implements Authentication {
  const AuthenticationUnauthenticated();
}

class AuthenticationAuthenticated implements Authentication {
  const AuthenticationAuthenticated({
    required this.accessToken,
  });

  final String accessToken;
}
