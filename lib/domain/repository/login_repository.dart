import 'package:flutter_dasher/common/model/user.dart';

abstract class LoginRepository {
  Future<User> login();
}
