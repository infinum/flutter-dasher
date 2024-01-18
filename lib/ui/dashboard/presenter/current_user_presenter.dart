import 'package:flutter_dasher/common/model/user.dart';
import 'package:flutter_dasher/domain/data/user_data_holder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentUserPresenter = StateProvider.autoDispose<User>(
  (ref) => ref.watch(userDataHolderProvider).user!,
);
