import 'package:flutter/material.dart';
import 'package:flutter_dasher/gen/assets.gen.dart';
import 'package:flutter_dasher/ui/common/buttons/primary_button.dart';
import 'package:flutter_dasher/ui/common/form/dasher_text_field.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 49),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  DasherTextField(
                    label: 'Username',
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 13),
                  DasherTextField(
                    label: 'Password',
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                  ),
                  SizedBox(height: 100),
                  PrimaryButton(
                    child: Text('Login'),
                  ),
                ],
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
            child: Assets.images.logo.svg(),
          ),
        ],
      ),
    );
  }
}
