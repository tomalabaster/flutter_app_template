# Flutter App Template

This is a template for Flutter apps with which I like to start projects from. It uses BLoCs and repositories.

## Getting started

Getting started is easy.

1. Fork this repo (optional)
2. Rename it to your preference (optional)
3. Clone it
4. Inside the root, run `flutter create --org com.yourdomain --project-name your_project_name .` from the command line to create the Android and iOS projects
5. Open your favourite code editor
6. Run a find and replace all for `flutter_app_template` to `your_project_name`

## BLoCs

There's an abstract class `BaseBloc<Event, State>` which can be extended and has a getter `buildState` to be overridden to return a full current state to make `yield`ing a state easier and cleaner.

## Repositories

There's an abstract class `IRepository<T>` which has some typical repository methods you can use to create a repository for a persistence layer suited to your app.
