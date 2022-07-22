# Table of contents

- [Flutter Clean Architecture Sample App - Dasher](#flutter-clean-architecture-sample-app---dasher)
- [Architecture structure](#architecture-structure)
  * [Presentation](#presentation)
    + [Widgets (UI)](#widgets--ui-)
    + [Presenter](#presenter)
  * [Domain](#domain)
    + [Interactor](#interactor)
    + [Data Holder](#data-holder)
  * [Outer layer](#outer-layer)
    + [Repository](#repository)
    + [Source remote](#source-remote)
    + [Source local](#source-local)
    + [Device](#device)
- [Folder structure](#folder-structure)
- [Riverpod and GetIt](#riverpod-and-getit)
- [Example of architecture flow](#example-of-architecture-flow)
  * [Presentation](#presentation-1)
    + [Widget](#widget)
    + [Presenter](#presenter-1)
  * [Domain](#domain-1)
    + [Interactor](#interactor-1)
    + [Repository](#repository-1)
- [Screenshots](#screenshots)

# Flutter Clean Architecture Sample App - Dasher

This project is a starting point for a Flutter application. Dasher App will introduce you to
clean architecture structure and how inner / outer layers are connected.

# Architecture structure

Dasher app uses the architecture structure described in [handbook](https://infinum.com/handbook/flutter/architecture/architecture).

![flutter-architecture-layers](https://user-images.githubusercontent.com/1117315/178720727-76ff7094-3f48-4127-b7ca-376f91e69682.png)

## Presentation
There is no business logic on this layer, it is only used to show UI and handle events. Read more
about Presentation layer in [handbook](https://infinum.com/handbook/flutter/architecture/architecture#presenters-and-widgets).

### Widgets (UI)
- Notify presenter of events such as screen display and user touch events.
- Observes presenter state and can rebuild on state change.

### Presenter
- Contains presentation logic, usually controlling the view state.

## Domain
This layer is responsible for business logic.

### Interactor
- The main job of the interactor is combining different repositories and handling business logic.

### Data Holder
- Singleton class that holds data in memory, that doesn't call repositories or other outer layers.

## Outer layer
### Repository
- It uses concrete implementations like dio, hive, add2calendar, other plugins and abstracts them
  from the rest of the application.
- Repository should be behind and interface.
- Interface belongs to the domain and the implementation belongs to the outer layers.

### Source remote
- Represents communication with remote sources (web, http clients, sockets).

### Source local
- Represents communication with local sources (database, shared_prefs).

### Device
- Represents communication with device hardware (e.g. sensors) or software
  (calendar, permissions).

# Folder structure

Top-level folder structure you will find in the project under the /lib:

<img width="480" alt="img_project_structure" src="https://user-images.githubusercontent.com/1117315/178676327-7a88b7d6-952e-4fa6-a5c3-307cb402b6ee.png">

- **app** contains app run_app with various setups like the setup of flutter.onError crash handling and dependency initialization.
- **common** contains code that's common to all layers and accessible by all layers.
- **device** is an outer layer that represents communication with device hardware (e.g. sensors) or software (calendar, permissions).
- **domain** is the inner layer that usually contains interactors, data holders. This layer should only contain business logic and not know about specific of ui, web, etc. or other layers.
- **source_local** is an outer layer that represents communication with local sources (database, shared_prefs).
- **source_remote** is an outer layer that represents communication with remote sources (web, http clients, sockets).
- **ui** is the layer where we package by feature widgets and presenters. Presenters contains presentation logic and they access domain and are provided in the view tree by Provider/Riverpod package.
- **main_production.dart** and **main_staging.dart** two versions of main file, each version has
  it's own flavor in practice this usually means having two versions. Find more about flavors
  [here](https://infinum.com/handbook/flutter/project-flow/flutter-flavors).

# Riverpod and GetIt

This architecture structure is using [Riverpod](https://riverpod.dev/) for Presentation layer
and [GetIt](https://pub.dev/packages/get_it) for Domain and outer layers (source remote, source
local and device).

Read more about how to use riverpod in [handbook](https://infinum.com/handbook/flutter/architecture/using-riverpod).

![flutter-architecture-layers-riverpod-getit](https://user-images.githubusercontent.com/1117315/178723072-9a2823cc-6b4d-4d15-be04-a6f5fd0bba97.png)

# Example of architecture flow
In this example, we'll show the architecture flow for fetching new Tweets on the Dashboard screen.

## Presentation
### Widget
![flutter-architecture-layers-riverpod-getit (2)](https://user-images.githubusercontent.com/1117315/178748869-3200cf10-0505-4aba-ad7b-f90e4e471ffb.png)

One of the widgets on the Dashboard screen is `DasherTweetsList`. Inside the Tweets list widget is
created reference to watch `feedRequestPresenter`.

```dart
final _presenter = ref.watch(feedRequestPresenter);
```

### Presenter
![flutter-architecture-layers-riverpod-getit (3)](https://user-images.githubusercontent.com/1117315/178749119-d3928b11-0a4e-4899-890c-da310c467b5d.png)

For `FeedRequestPresenter` we are using `RequestProvider`, you can find more about it [here](https://github.com/infinum/flutter-bits/tree/master/request_provider).

Inside `FeedRequestPresenter` we created instance of `FetchFeedInteractor` interface.

```dart
final feedRequestPresenter = ChangeNotifierProvider.autoDispose<FeedRequestPresenter>(
  (ref) => FeedRequestPresenter(GetIt.instance.get()),
);

class FeedRequestPresenter extends RequestProvider<List<Tweet>> {
  FeedRequestPresenter(this._feedTimelineInteractor) {
    fetchTweetsTimeline();
  }

  final FetchFeedInteractor _feedTimelineInteractor;

  Future<void> fetchTweetsTimeline() {
    return executeRequest(requestBuilder: _feedTimelineInteractor.fetchFeedTimeline);
  }
}
```

From this part, we slowly transition toward Domain layer.

## Domain
### Interactor
![flutter-architecture-layers-riverpod-getit (4)](https://user-images.githubusercontent.com/1117315/178749319-34a00de7-1f33-438d-b501-ecd80ad1b88f.png)

Domain is a business logic layer, where we have an implementation of `FetchFeedInteractor` called
`FetchFeedInteractorImpl`. Our task is to create an instance of Repository which is responsible
for handling outer logic for getting user timeline tweets. `FeedRepository` is also behind an interface.
```dart
class FetchFeedInteractorImpl implements FetchFeedInteractor {
  FetchFeedInteractorImpl(this._feedRepository);

  final FeedRepository _feedRepository;

  @override
  Future<List<Tweet>> fetchFeedTimeline() {
    return _feedRepository.fetchFeedTimeline();
  }
}
```

### Repository
![flutter-architecture-layers-riverpod-getit (5)](https://user-images.githubusercontent.com/1117315/178749678-9b33376c-5144-4644-855b-786cac657827.png)

`FeedRepositoryImpl` is part of Source remote layer. This repository is using [twitter_api_v2](https://pub.dev/packages/twitter_api_v2)
package for fetching data from Twitter's API.

```dart
Future<List<Tweet>> fetchFeedTimeline() async {
  final response = await twitterApi.tweetsService.lookupHomeTimeline(
    userId: userDataHolder.user!.id,
    tweetFields: [
      TweetField.publicMetrics,
      TweetField.createdAt,
    ],
    userFields: [
      UserField.createdAt,
      UserField.profileImageUrl,
    ],
    expansions: [
      TweetExpansion.authorId,
    ],
  );

  return _getTweetsListWithAuthors(response);
}
```

after a successful response, data is passed back to `FeedRequestPresenter` in his state,
and it triggers state listeners. Inside the build method of `DasherTweetsList` we use state
listeners of `FeedRequestPresenter` so we can easily show/hide widgets depending on the emitted event.

![flutter-architecture-layers-riverpod-getit (6)](https://user-images.githubusercontent.com/1117315/178750109-7e92255e-6894-4b03-aff8-0d6793388afc.png)

```dart
  _presenter.state.maybeWhen(
    success: (feed) => _TweetsList(
      feed: feed,
    ),
    initial: () => const CircularProgressIndicator(),
    loading: (feed) {
      if (feed == null) {
        return const CircularProgressIndicator();
      } else {
        return _TweetsList(
          feed: feed,
        );
      }
    },
    failure: (e) => Text('Error occurred $e'),
    orElse: () => const CircularProgressIndicator(),
  ),
```

# Screenshots

| Login | Feed | 
| ----- | ---- | 
| <img width=370 src='https://user-images.githubusercontent.com/1117315/178444537-bcdef137-3f43-4d28-ae21-1b980ed2f048.png' /> | <img width=370 src='https://user-images.githubusercontent.com/1117315/178444857-721c5d32-2b42-48b5-8ed2-6b7a68aef98e.png' /> | 

| Profile | New Tweet |
| ------- | --------- |
| <img width=370 src='https://user-images.githubusercontent.com/1117315/178444942-42270ec3-40ea-4118-bfa7-a9371299cc8e.png' /> | <img width=370 src='https://user-images.githubusercontent.com/1117315/178445000-fce6a603-90d6-4166-9d1d-eaba82343784.png' /> |


<p align="center">
  <a href='https://infinum.com'>
    <picture>
        <source srcset="https://assets.infinum.com/brand/logo/static/white.svg" media="(prefers-color-scheme: dark)">
        <img src="https://assets.infinum.com/brand/logo/static/default.svg">
    </picture>
  </a>
</p>
