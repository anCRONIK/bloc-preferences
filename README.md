# BLoC Preferences with internationalization

Implementation of application preferences and internationalization using BLoC and Clean Architecture pattern.
This is not library (but it could become one), it is just example of my implementation that could make life easier to someone else. I'm new to Flutter so probably there are things that could be done easier/prettier.
I tried to keep things simple while experimenting with libraries that are pretty cool.

Feature `application_preferences` contains implementation part, while feature `test_app` is here only for showing this implementation in action.

# Internationalization

Internationalization is implemented really simple, I didn't want to include some localization library so some simple implementation is made using translation files (`en.json` and `hr.json`).
There is `TranslationFileRepository` which loads JSON files from assets folder and `Translator` which handles language changes and getting translations.
Because presentation layer shouldn't be aware of `Translator`, there is `i18n` package in `core` which provides method for translating and changing language.

# Application preferences

There is entity `ApplicationPreferences` which should contain preferences that we want to store. With some work this could be full extendable, but you can easily add your own keys that you want to store.
BLoC implementation is pretty simple, and we have only two states. Initial state is `loaded` because get operation on shared preferences is not async so we can easily fetch stuff. If that wouldn't be the case,
we would need to add new state (e.g. `loading`) and new event (e.g. `load`) and make main `Stateful` so that we can put event `load` in `initState`.

# Unit tests

They are not the greatest, but they exists :)

# Building application

You need to build stuff with build runner `flutter pub run build_runner build --delete-conflicting-outputs` (instead of build you can use `watch` for continuous build).

# Test application

It consist of two pages, home and settings