import 'package:flutter_dasher/common/model/user.dart';
import 'package:flutter_dasher/domain/data/user_data_holder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user.g.dart';

@riverpod
User currentUser(CurrentUserRef ref) {
  return ref.watch(userDataHolderProvider).user!;
}
