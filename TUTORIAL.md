# Table of contents

- [Flutter Architecture Sample App - Dasher](#flutter-architecture-sample-app---dasher)
- [Architecture structure](#architecture-structure)
    * [Presentation](#presentation)
        + [Presenter - Request Presenter - Widget](#presenter---request-presenter---widget)
    * [Domain](#domain)
        + [Data](#data)
        + [Interactor](#interactor)
        + [Repository](#repository)
    * [Source remote](#source-remote)
    * [Source local](#source-local)
    * [Device](#device)
- [How everything is connected?](#how-everything-is-connected)
    * [Main dependencies inject](#main-dependencies-inject)
        + [Source remote - dependencies inject](#source-remote---dependencies-inject)
        + [Source local - dependencies inject](#source-local---dependencies-inject)
        + [Device - dependencies inject](#device---dependencies-inject)
- [How to use common folder?](#how-to-use-common-folder)
    * [Flavor](#flavor)
    * [Model](#model)
- [Project setup](#project-setup)
    * [Flutter Version Manager](#flutter-version-manager)
    * [Code generation](#code-generation)
    * [Assets](#assets)
    * [Splash screen](#splash-screen)
- [Packages for handling outer layer of architecture](#packages-for-handling-outer-layer-of-architecture)
    * [API](#api)
        + [Twitter oauth2 PKCE](#twitter-oauth2-pkce)
        + [Twitter API v2](#twitter-api-v2)
- [Screenshots](#screenshots)

# Flutter Architecture Sample App - Dasher

This project is a starting point for a Flutter application. Dasher App will introduce you to
architecture structure and how inner / outer layers are connected.
After architecture structure, we'll cover how to set up the Dasher project on a local machine and
also cover a few tools that are most commonly used in all projects.

# Architecture structure

Dasher app uses the architecture structure described in [handbook](https://infinum.com/handbook/flutter/architecture/architecture).

Below is the architecture tree:

- Presentation
    - View
    - Presenter
- Domain
    - Interactor
    - Data Holder
    - Repository / Manager
- Source remote
- Source local
- Device

Check out more about Architecture structure in the handbook [here](https://infinum.com/handbook/flutter/architecture/architecture).

## Presentation

Folder structure: `lib/ui`

Structure of `ui` folder:

- Screen widget - `lib/ui/{screen_name}/{screen_name}_screen.dart`
- Widgets related to specific screen - `lib/ui/{screen_name}/widget/{widget_name}_screen.dart`
- Presenter - `lib/ui/{screen_name}/presenter/{screen_name}_presenter.dart`
- Request presenter - `lib/ui/{screen_name}/presenter/{screen_name}_request_presenter.dart`

### Presenter - Request Presenter - Widget

Inside Presentation layer are Presenters and widgets that are part of the UI folder.
Together, they are included in the layer because they are closely related. Presenter contains
logic that most often controls the view state. Widget observes that state and can rebuild on
state change.

Request presenters are a little bit different because the request is a state of its own with values
(loading, success, failure, and initial). That's why it's not a good practice to bundle multiple
requests with all other states in one main state. Most often you need to listen to one specific
request state and change UI to show a loading widget or error, and if we bundle it all in one huge
state that presenter will update all hooked listeners.

Read more about Presenters and widgets in the handbook [here](https://infinum.com/handbook/flutter/architecture/architecture#presenters-and-widgets).

## Domain

Folder structure: `lib/domain`

- Data - `lib/domain/data/{name}_data_holder.dart`
- Interactor - `lib/domain/interactor/{screen_name}/{screen_name}_interactor.dart`
- Interactor implementation - `lib/domain/interactor/{screen_name}/{screen_name}_interactor_impl. dart`
- Repository - `lib/domain/repository/{name}_repository.dart`

Domain contains the business logic of the application.

### Data

Inside the `Data` folder are data holders implemented as singleton class that holds data in memory.
It only has data and methods to get or set data. Data holders don't interact with other layers
of architecture.

Read more about Data holders in the handbook [here](https://infinum.com/handbook/flutter/architecture/architecture#data-holders).

### Interactor

Interactor is also an inner layer of architecture and belongs to the domain, with interactor we can
easily communicate with other classes inside the domain. In folder structure there is `Interactor`
and `Interactor implementation`, because we put interactor behind an interface for easier testing.
Interactor's purpose is to combine different repositories and handle business logic.

Read more about Interactor in the handbook [here](https://infinum.com/handbook/flutter/architecture/architecture#interactor).

### Repository

All of the above is responsible for the inner layer of architecture, now few words about the first
component which is part of the outer layer. Repository also should be behind the interface, so
the interface belongs to the domain and the implementation class can be found in a few places like
`source_remote`, `source_local` and `device`. This way the domain can access repository, but it
doesn't know about the specific implementation of that interface.
Sometimes it's possible to find Manager instead of Repository but it works the same as
Repository. Sometimes this layer can interact with calendar, camera, or Bluetooth so it's more
managing nature of architecture logic than repository logic (Better naming for CameraRepository
should be CameraManager).

Read more about Repository in handbook [here](https://infinum.com/handbook/flutter/architecture/architecture#repository-and-manager).

## Source remote

Folder structure: `lib/source_remote`

Source remote is an outer layer that represents communication with remote sources (web, http clients, sockets).

- Repository implementation - `lib/source_remote/impl/{name}_repository_impl.dart`

## Source local

Folder structure: `lib/source_local`

Source local is an outer layer that represents communication with local sources (database,
shared_prefs).

- Repository implementation - `lib/source_local/impl/{name}_repository_impl.dart`

## Device

Folder structure: `lib/device`

Device is an outer layer that represents communication with device hardware (e.g. sensors) or
software (calendar, permissions).

- Repository implementation - `lib/device/impl/{name}_repository_impl.dart`

# How everything is connected?

The inner or outer layer of architecture has its dependencies inject, all inner and
outer layers of architecture are connected with the main dependencies inject. Below is folder
structure logic.

## Main dependencies inject

Folder structure: `lib/app/di/inject_dependencies.dart`

```dart
final getIt = GetIt.instance;

device.injectDependencies(getIt);
domain.injectDependencies(getIt);
source_local.injectDependencies(getIt);
source_remote.injectDependencies(getIt);
```

### Source remote - dependencies inject

Folder structure: `lib/source_remote/di/inject_dependencies.dart`

Inside Source remote dependencies inject are all connections between the inner domain repository and
the outer layer of source remote repository implementation.

### Source local - dependencies inject

Folder structure: `lib/source_local/di/inject_dependencies.dart`

Inside Source local dependencies inject are all connections between the inner domain repository and
the outer layer of a source local repository implementation.

### Device - dependencies inject

Folder structure: `lib/device/di/inject_dependencies.dart`

Inside device dependencies, inject are all connections between the inner domain repository and
the outer layer of device repository implementation.

# How to use common folder?

The folder structure we can find in `app/common` folder are `flavor` and `model`.

## Flavor

Flavors allow us to have multiple versions of the same app. Most used two versions:

- staging: for development and testing (connected to staging API)
- production: for end-users (connected to production API)

Read more about Flavors and how to set up flavors inside the project find [here](https://infinum.com/handbook/flutter/project-flow/flutter-flavors).

## Model

These are the models that are used by multiple layers. For example, you can have User with @JsonSerializable
that's used by source_remote, but that same model is also used by domain and UI.

Also some models can be part of specific layer (`lib/source_remote/model` or
`lib/ui/my_feature/model`) or inside specific feature
(`lib/domain/manager/permission_manager/device_permissions.dart`) if that makes more sense.

Read more about Models [here](https://infinum.com/handbook/flutter/architecture/architecture#models).

# Project setup

## Flutter Version Manager

The project uses [Flutter Version Manager](https://fvm.app/docs/getting_started/overview) to ensure
consistent app builds by referencing the Flutter SDK version used on a per-project basis. Version and
configuration can be found and specified in `fvm_config.json` file.

After checking flutter version from `fvm_config.json` file, install the same version with `fvm`.
For example, Dasher app is using Flutter version `3.0.4`, to install a specific version of Flutter use
this command:

```shell
fvm install 3.0.4
```

now use the version that is installed:

```shell
fvm use 3.0.4
```

the last step to connect fvm to our project is to change Flutter SDK path inside Android Studio project
configuration.

Go to: `Android Studio -> Preferences -> Languages & Frameworks -> Flutter` and under `Flutter SDK path`
put `/Users/{your_username}/Projects/flutter_dasher/.fvm/flutter_sdk`

![Android Studio FVM folder path](https://user-images.githubusercontent.com/1117315/178278804-fac07195-a4cb-44b0-ae4a-02f86d527b71.png)

Apply options and most important part **Restart Android Studio** to apply project changes.

From now on whenever you used `flutter` command, now use `fvm flutter`.

Let's try this command, we need to get all packages and dependencies for Dasher app, run:

```shell
fvm flutter pub get
```

## Code generation

Dasher app inside model is using JSON serialization / deserialization code `toJson` this part of
code is generated using [json_serializble](https://pub.dev/packages/json_serializable).
Use this command to run code generation after updating any model:

```shell
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

Generated files should be added to the source tree, but they should not be manually edited.
Whenever model files are changed best practice is to run the above command.

## Assets

Dasher app is using [flutter_gen_runner](https://pub.dev/packages/flutter_gen_runner) code
generator for your assets, fonts, and colors, to make accessing assets easier.
In `pubspec.yaml` is all configuration for assets declaration. All assets should be placed and
organized in folder `assets/`.

Every time we add / remove an asset from that folder we should run:

```shell
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

## Splash screen

For splash screen Dasher app is using [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)
code generator. Assets used for the splash screen organize inside `assets/` folder. All splash screen
configuration is done through `pubspec.yaml`.

After adding your settings, run the following command in the terminal:

```shell
fvm flutter pub run flutter_native_splash:create
```

In Dasher app this is how the splash screen is initialized:

```dart
WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
```

Whenever your initialization is completed, remove the splash screen, and easily we remove it with:

```dart
FlutterNativeSplash.remove();
```

# Packages for handling outer layer of architecture

## API

Dasher is using the official Twitter API, more about API can be found [here](https://developer.twitter.com/en/docs/twitter-api).
To grant access to Twitter API it is mandatory to apply for a Developer account, after registration we
get all tokens, secrets, and keys to set up our app.

For this project, we already did all setup and configuration with all keys stored in two main
files, one for each flavor `main_production.dart` and `main_staging.dart`, configuration looks
like this:

```dart
FlavorConfig(
  flavor: Flavor.production,
  name: 'Production',
  values: const FlavorValues(
    baseUrl: 'production URL',
    // Info from Twitter Developer API Dashboard
    clientId: 'Uk1pRElPZnd0TlBQSDFIY2VjUUM6MTpjaQ',
    clientSecret: 'DCxJ_zS2VNXIwmyfSBNUJBzeprYLgIiNYCIkixWdpt1W7s3qd2',
    redirectUri: 'org.example.android.oauth://callback/',
    customUriScheme: 'org.example.android.oauth',
  ),
);
```

If we want to use most of the Twitter API it's important to use OAuth 2.0 Authorization Code Flow with PKCE
way of authorization. This project is using [twitter_oauth2_pkce](https://pub.dev/packages/twitter_oauth2_pkce) with
[twitter_api_v2](https://pub.dev/packages/twitter_api_v2) for easier handling of Twitter API.

Read more about Twitter OAuth 2.0 Authorization Code Flow with PKCE [here](https://developer.twitter.com/en/docs/authentication/oauth-2-0/authorization-code).

### Twitter oauth2 PKCE

Let's check the diagram of how that authorization is working:
![OAuth_Twitter](https://user-images.githubusercontent.com/1117315/178433904-b9e26ff0-bc81-49b1-ae73-f5bc6f7211f9.png)

twitter_oauth2_pkce package is doing all that work for us. Dasher app has configuration for this
part stored in `lib/source_remote/twitter/create_twitter_oauth.dart`:

```dart
TwitterOAuth2Client createTwitterOAuth() {
  return TwitterOAuth2Client(
    clientId: FlavorConfig.instance.values.clientId,
    clientSecret: FlavorConfig.instance.values.clientSecret,
    redirectUri: FlavorConfig.instance.values.redirectUri,
    customUriScheme: FlavorConfig.instance.values.customUriScheme,
  );
}
```

on Login we trigger authorization request which is stored inside
`lib/source_remote/impl/login_repository_impl.dart`:

```dart
final response = await twitterOAuth2Client.executeAuthCodeFlowWithPKCE(
  scopes: Scope.values,
);
```

the package is handling redirection from Dasher app to the browser and opens twitter.com to authorize
(here we need a Twitter account) as a success response, we get `accessToken` which is used in
next step.

### Twitter API v2

Twitter API v2 package has all request methods for creating tweets, fetching timeline tweets, and
many more... First, we need to create a singleton of Twitter service with accessToken, this part is
also handled inside `lib/source_remote/impl/login_repository_impl.dart`:

```dart
final twitter = v2.TwitterApi(bearerToken: response.accessToken);

GetIt.instance.registerSingleton(twitter);
```

Now singleton is ready for use, it's accessible to other parts of the app and authorized with
accessToken.

# Screenshots

| Login | Feed | 
| ------- | ------ | 
|   <img width=370 src='https://user-images.githubusercontent.com/1117315/178444537-bcdef137-3f43-4d28-ae21-1b980ed2f048.png' />    |    <img width=370 src='https://user-images.githubusercontent.com/1117315/178444857-721c5d32-2b42-48b5-8ed2-6b7a68aef98e.png' />    | 

| Profile | New Tweet |
| --------- | ----------- |
|     <img width=370 src='https://user-images.githubusercontent.com/1117315/178444942-42270ec3-40ea-4118-bfa7-a9371299cc8e.png' />      |       <img width=370 src='https://user-images.githubusercontent.com/1117315/178445000-fce6a603-90d6-4166-9d1d-eaba82343784.png' />      |
