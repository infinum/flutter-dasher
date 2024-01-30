import 'package:flutter/material.dart';
import 'package:flutter_dasher/authenticate/login_notifier.dart';
import 'package:flutter_dasher/gen/assets.gen.dart';
import 'package:flutter_dasher/ui/common/buttons/primary_button.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';
import 'package:flutter_dasher/ui/routing/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.watch(loginNotifierProvider.login);

    ref.listen(loginNotifierProvider.login, (_, next) {
      if (next case LoginMutationSuccess()) {
        DashboardScreenRoute().go(context);
      }
    });

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _HeaderIllustration(),
            const SizedBox(height: 24),
            Text(
              'Dasher',
              textAlign: TextAlign.center,
              style: Look.of(context).typography.h1.copyWith(color: Look.of(context).color.onBackground),
            ),
            const SizedBox(height: 34),
            Text(
              'Please Log In to continue',
              textAlign: TextAlign.center,
              style: Look.of(context).typography.subtitle1.copyWith(color: Look.of(context).color.onBackground),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 22,
              ),
              child: PrimaryButton(
                onPressed: () => login(),
                child: const Text('Login with Twitter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderIllustration extends StatelessWidget {
  const _HeaderIllustration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Look.of(context).color.primary,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 44,
            child: Assets.svg.logo.svg(),
          ),
        ],
      ),
    );
  }
}
