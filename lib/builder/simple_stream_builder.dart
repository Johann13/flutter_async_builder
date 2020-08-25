import 'package:flutter/widgets.dart';
import 'package:flutter_async_builder/builder/builder_functions.dart';

class SimpleStreamBuilder<T> extends StreamBuilder<T> {
  SimpleStreamBuilder({
    @required Stream<T> stream,
    @required DataBuilder<T> builder,
    ErrorBuilder error,
    WidgetBuilder loading,
    T initialData,
  }) : super(
          initialData: initialData,
          stream: stream,
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
            }
            if (!snapshot.hasData) {
              if (loading == null) {
                return Container();
              } else {
                return loading(context);
              }
            }
            return builder(context, snapshot.data);
          },
        );
}

class SimpleStreamListBuilder<T> extends StreamBuilder<List<T>> {
  SimpleStreamListBuilder({
    @required Stream<List<T>> stream,
    @required DataBuilder<List<T>> builder,
    List<T> initialData,
    ErrorBuilder error,
    WidgetBuilder loading,
    WidgetBuilder empty,
  }) : super(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              if (error == null) {
                return Center(
                  child: Text(
                    'an error occurred:\n' + snapshot.error.toString(),
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
            } else if (snapshot.data.isEmpty) {
              if (empty == null) {
                return Center(
                  child: Text('No data found'),
                );
              } else {
                return empty(context);
              }
            } else {
              return builder(context, snapshot.data);
            }
          },
        );
}

class AnimatedStreamBuilder<T> extends StreamBuilder<T> {
  AnimatedStreamBuilder({
    @required Stream<T> stream,
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
          stream: stream,
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

class AnimatedStreamListBuilder<T> extends StreamBuilder<List<T>> {
  AnimatedStreamListBuilder({
    @required Stream<List<T>> stream,
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
          stream: stream,
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
                child = Center(
                  child: Text('No data found'),
                );
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
