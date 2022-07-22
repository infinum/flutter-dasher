import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  var progress = context.logger.progress('Installing... flutter version: {{flutter_version}}');
  await Process.run('fvm', ['install', '{{flutter_version}}'], runInShell: true);
  await Process.run('fvm', ['use', '{{flutter_version}}'], runInShell: true);
  progress.complete();

  progress = context.logger.progress('Executing... pubspec update');
  await Process.run(
      'fvm',
      [
        'flutter',
        'pub',
        'add',
        'alice',
        'cupertino_icons',
        'dio',
        'firebase_crashlytics',
        'flutter_hooks',
        'flutter_loggy',
        'flutter_loggy_dio',
        'flutter_riverpod',
        'get_it',
        'hooks_riverpod',
        'json_annotation',
        'loggy',
        'freezed_annotation'
      ],
      runInShell: true);
  await Process.run(
      'fvm',
      [
        'flutter',
        'pub',
        'add',
        '--dev',
        'build_runner',
        'dart_code_metrics',
        'flutter_gen_runner',
        'flutter_lints',
        'json_serializable',
        'freezed'
      ],
      runInShell: true);
  progress.complete();

  progress = context.logger.progress('Updating... pod repo');
  await Process.run('pod', ['repo', 'update'], runInShell: true);
  progress.complete();

  progress = context.logger.progress('Adding brick... look');
  await Process.run('mason', ['add', 'look', '--git-url', 'https://github.com/infinum/flutter-bits.git', '--git-path', 'look/'],
      runInShell: true);
  progress.complete();

  progress = context.logger.progress('Installing... look');
  await Process.run('mason', ['make', 'look', '--output-dir', 'lib/ui/common'], runInShell: true);
  progress.complete();

  progress = context.logger.progress('Adding brick... request_provider');
  await Process.run('mason',
      ['add', 'request_provider', '--git-url', 'https://github.com/infinum/flutter-bits.git', '--git-path', 'request_provider/'],
      runInShell: true);
  progress.complete();

  progress = context.logger.progress('Installing... request_provider');
  await Process.run(
      'mason', ['make', 'request_provider', '--on-conflict', 'overwrite', '--output-dir', 'lib/ui/common/bits/request_provider'],
      runInShell: true);
  progress.complete();

  progress = context.logger.progress('Cleaning bricks...');
  await Process.run('mason', ['remove', 'hello'], runInShell: true);
  progress.complete();

  progress = context.logger.progress('Updating... files structure');
  await Process.run('rm', ['lib/main.dart'], runInShell: true);
  await Process.run('rm', ['.idea/runConfigurations/main_dart.xml'], runInShell: true);
  progress.complete();
}
