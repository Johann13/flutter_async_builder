import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_async_builder/builder/builder_functions.dart';

class SimpleFutureBuilder<T> extends FutureBuilder<T> {
  SimpleFutureBuilder({
    @required Future<T> future,
    @required DataBuilder<T> builder,
    ErrorBuilder error,
    WidgetBuilder loading,
    T initialData,
  }) : super(
          initialData: initialData,
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              if (error == null) {
                return Center(
                  child: Text(
                    'an error occurred ' + snapshot.error.toString(),
                  ),
                );
              } else {
                return error(context, snapshot.error);
              }
            } else if (!snapshot.hasData) {
              if (loading == null) {
                return Container();
              } else {
                return loading(context);
              }
            } else {
              return builder(context, snapshot.data);
            }
          },
        );
}

class SimpleFutureListBuilder<T> extends FutureBuilder<List<T>> {
  SimpleFutureListBuilder({
    @required Future<List<T>> future,
    @required DataBuilder<List<T>> builder,
    List<T> initialData,
    ErrorBuilder error,
    WidgetBuilder loading,
    WidgetBuilder empty,
  }) : super(
          initialData: initialData,
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              if (error != null) {
                return error(context, snapshot.error);
              } else {
                return Center(
                  child: Text(
                    'an error occurred:\n' + snapshot.error.toString(),
                  ),
                );
              }
            } else if (!snapshot.hasData) {
              if (loading == null) {
                return Container();
              } else {
                return loading(context);
              }
            } else if (snapshot.data.isEmpty) {
              if (empty == null) {
                return Container();
              } else {
                return empty(context);
              }
            } else {
              return builder(context, snapshot.data);
            }
          },
        );
}

class AnimatedFutureBuilder<T> extends FutureBuilder<T> {
  AnimatedFutureBuilder({
    @required Future<T> future,
    @required DataBuilder<T> builder,
    ErrorBuilder error,
    WidgetBuilder loading,
    T initialData,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration,
    Curve switchInCurve = Curves.linear,
    Curve switchOutCurve = Curves.linear,
    AnimatedSwitcherTransitionBuilder transitionBuilder =
        AnimatedSwitcher.defaultTransitionBuilder,
    AnimatedSwitcherLayoutBuilder layoutBuilder =
        AnimatedSwitcher.defaultLayoutBuilder,
  }) : super(
          initialData: initialData,
          future: future,
          builder: (context, snapshot) {
            Widget child;
            if (snapshot.hasError) {
              if (error == null) {
                child = Center(
                  child: Text(
                    'an error occurred ' + snapshot.error.toString(),
                  ),
                );
              } else {
                child = error(context, snapshot.error);
              }
            } else if (!snapshot.hasData) {
              if (loading == null) {
                child = Container();
              } else {
                child = loading(context);
              }
            } else {
              child = builder(context, snapshot.data);
            }
            return AnimatedSwitcher(
              duration: duration,
              child: child,
              reverseDuration: reverseDuration,
              switchInCurve: switchInCurve,
              switchOutCurve: switchOutCurve,
              transitionBuilder: transitionBuilder,
              layoutBuilder: layoutBuilder,
            );
          },
        );
}

class AnimatedFutureListBuilder<T> extends FutureBuilder<List<T>> {
  AnimatedFutureListBuilder({
    @required Future<List<T>> future,
    @required DataBuilder<List<T>> builder,
    ErrorBuilder error,
    WidgetBuilder loading,
    WidgetBuilder empty,
    List<T> initialData,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration,
    Curve switchInCurve = Curves.linear,
    Curve switchOutCurve = Curves.linear,
    AnimatedSwitcherTransitionBuilder transitionBuilder =
        AnimatedSwitcher.defaultTransitionBuilder,
    AnimatedSwitcherLayoutBuilder layoutBuilder =
        AnimatedSwitcher.defaultLayoutBuilder,
  }) : super(
          initialData: initialData,
          future: future,
          builder: (context, snapshot) {
            Widget child;
            if (snapshot.hasError) {
              if (error == null) {
                child = Center(
                  child: Text(
                    'an error occurred ' + snapshot.error.toString(),
                  ),
                );
              } else {
                child = error(context, snapshot.error);
              }
            } else if (!snapshot.hasData) {
              if (loading == null) {
                child = Container();
              } else {
                child = loading(context);
              }
            } else if (snapshot.data.isEmpty) {
              if (empty == null) {
                child = Container();
              } else {
                child = empty(context);
              }
            } else {
              child = builder(context, snapshot.data);
            }

            return AnimatedSwitcher(
              duration: duration,
              child: child,
              reverseDuration: reverseDuration,
              switchInCurve: switchInCurve,
              switchOutCurve: switchOutCurve,
              transitionBuilder: transitionBuilder,
              layoutBuilder: layoutBuilder,
            );
          },
        );
}
