#BLoC Preferences with internationalization

Implementation of application preferences and internationalization using BLoC and Clean Architecture pattern.
This is not library (but it could become one), it is just example of my implementation that could make life easier to someone else. I'm new to Flutter so probably there are things that could be done easier/prettier.
I tried to keep things simple while experimenting with libraries that are pretty cool.

Feature `application_preferences` contains implementation part, while feature `test_app` is here only for showing this implementation in action.

#Internationalization

Internationalization is implemented really simple, I didn't want to include some localization library so some simple implementation is made using translation files (`en.json` and `hr.json`).
There is `TranslationFileRepository` which loads JSON files from assets folder and `Translator` which handles language changes and getting translations.
Because presentation layer shouldn't be aware of `Translator`, there is `i18n` package in `core` which provides method for translating and changing language.

#Application preferences

There is entity `ApplicationPreferences` which should contain preferences that we want to store.
