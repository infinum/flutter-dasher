import 'package:flutter_dasher/common/model/user.dart';
import 'package:flutter_dasher/domain/data/user_data_holder.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentUserProvider = StateProvider.autoDispose<User>(
  (ref) => GetIt.instance.get<UserDataHolder>().user!,
);
