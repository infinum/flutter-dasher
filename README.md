# Table of contents


# Flutter Clean Architecture Sample App - Dasher

This project is a starting point for a Flutter application. Dasher App will introduce you to
clean architecture structure and how inner / outer layers are connected.

# Architecture structure

Dasher app uses the architecture structure described in [handbook](https://infinum.com/handbook/flutter/architecture/architecture).

![flutter-architecture-layers](https://user-images.githubusercontent.com/1117315/178720727-76ff7094-3f48-4127-b7ca-376f91e69682.png)

## Role and description of each layer
### Presentation
There is no business logic on this layer, it is only used to show UI and handle events. Read more
about Presentation layer in [handbook](https://infinum.com/handbook/flutter/architecture/architecture#presenters-and-widgets).

#### Widgets (UI)
- Notify presenter of events such as screen display and user touch events.
- Observes presenter state and can rebuild on state change.

#### Presenter
- Contains presentation logic, usually controlling the view state.

### Domain
This layer is responsible for business logic.

#### Interactor
- Main job of interactor is combining different repositories and handling business logic.

#### Data Holder
- Singleton class that holds data in memory, that doesn't call repositories or other outer layers.

### Outer layer
#### Repository
- It uses concrete implementations like dio, hive, add2calendar, other plugins and abstracts them 
from the rest of the application.
- Repository should be behind and interface.
- Interface belongs to the domain and the implementation belongs to the outer layers.

#### Source remote
- Represents communication with remote sources (web, http clients, sockets).

#### Source local
- Represents communication with local sources (database, shared_prefs).

#### Device
- Represents communication with device hardware (e.g. sensors) or software 
  (calendar, permissions).

# Folder structure

Top-level folder structure you will find in the project under the /lib:

<img width="480" alt="img_project_structure" src="https://user-images.githubusercontent.com/1117315/178676327-7a88b7d6-952e-4fa6-a5c3-307cb402b6ee.png">

- **app** contains app run_app with various setups like setup of flutter.onError crash handling and dependency initialization.
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
and [GetIt](https://pub.dev/packages/get_it) for Domain and outer layers (source remove, source 
local and device).

Read more how to use riverpod in [handbook](https://infinum.com/handbook/flutter/architecture/using-riverpod).

![flutter-architecture-layers-riverpod-getit](https://user-images.githubusercontent.com/1117315/178723072-9a2823cc-6b4d-4d15-be04-a6f5fd0bba97.png)

# Example of architecture flow
In this example we'll show architecture flow for fetching new Tweets on Dashboard screen.

## Presentation
### Widget
One of the widgets on Dashboard screen is `dasher_tweets_list.dart`. In Tweets list widget is 
created reference to watch `feedRequestProvider`.

```dart
final _provider = ref.watch(feedRequestProvider);
```

# Screenshots

| Login | Feed | 
| ----- | ---- | 
| <img width=370 src='https://user-images.githubusercontent.com/1117315/178444537-bcdef137-3f43-4d28-ae21-1b980ed2f048.png' /> | <img width=370 src='https://user-images.githubusercontent.com/1117315/178444857-721c5d32-2b42-48b5-8ed2-6b7a68aef98e.png' /> | 

| Profile | New Tweet |
| ------- | --------- |
| <img width=370 src='https://user-images.githubusercontent.com/1117315/178444942-42270ec3-40ea-4118-bfa7-a9371299cc8e.png' /> | <img width=370 src='https://user-images.githubusercontent.com/1117315/178445000-fce6a603-90d6-4166-9d1d-eaba82343784.png' /> |
