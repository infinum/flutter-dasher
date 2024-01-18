import 'package:flutter_dasher/common/model/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data_holder.g.dart';

@Riverpod(keepAlive: true)
UserDataHolder userDataHolder(UserDataHolderRef ref) {
  return UserDataHolder();
}

class UserDataHolder {
  User? user;
}
