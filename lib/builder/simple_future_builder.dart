import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_async_builder/builder/builder_functions.dart';

class SimpleFutureBuilder<T> extends FutureBuilder<T> {
  SimpleFutureBuilder({
    Key key,
    @required Future<T> future,
    @required DataBuilder<T> builder,
    WidgetBuilder nullBuilder,
    WidgetBuilder loading,
    ErrorBuilder error,
    T initialData,
  }) : super(
          key: key,
          initialData: initialData,
          future: future,
          builder: (context, snapshot) {
            Widget widget;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                if (loading != null) {
                  widget = loading(context);
                } else {
                  widget = Container();
                }
                break;
              case ConnectionState.active:
                if (snapshot.hasError) {
                  if (error != null) {
                    widget = error(context, snapshot.error);
                  } else {
                    widget = Text('${snapshot.error}');
                  }
                } else {
                  if (snapshot.hasData) {
                    widget = builder(context, snapshot.data);
                  } else {
                    if (nullBuilder != null) {
                      widget = nullBuilder(context);
                    } else {
                      widget = builder(context, snapshot.data);
                    }
                  }
                }
                break;
              case ConnectionState.done:
                if (error != null) {
                  widget = error(context, 'ConnectionState.done');
                } else {
                  widget = Text('ConnectionState.done');
                }
                break;
            }
            return widget;
          },
        );
}

class SimpleFutureListBuilder<T> extends FutureBuilder<List<T>> {
  SimpleFutureListBuilder({
    @required Future<List<T>> future,
    @required DataBuilder<List<T>> builder,
    WidgetBuilder nullBuilder,
    List<T> initialData,
    ErrorBuilder error,
    WidgetBuilder loading,
    WidgetBuilder empty,
  }) : super(
          future: future,
          builder: (context, snapshot) {
            Widget widget;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                if (loading != null) {
                  widget = loading(context);
                } else {
                  widget = Container();
                }
                break;
              case ConnectionState.active:
                if (snapshot.hasError) {
                  if (error != null) {
                    widget = error(context, snapshot.error);
                  } else {
                    widget = Text('${snapshot.error}');
                  }
                } else {
                  if (snapshot.hasData) {
                    if (snapshot.data.isEmpty) {
                      if (empty != null) {
                        widget = empty(context);
                      } else {
                        widget = builder(context, snapshot.data);
                      }
                    } else {
                      widget = builder(context, snapshot.data);
                    }
                  } else {
                    if (nullBuilder != null) {
                      widget = nullBuilder(context);
                    } else {
                      widget = builder(context, snapshot.data);
                    }
                  }
                }
                break;
              case ConnectionState.done:
                if (error != null) {
                  widget = error(context, 'ConnectionState.done');
                } else {
                  widget = Text('ConnectionState.done');
                }
                break;
            }
            return widget;
          },
        );
}

class AnimatedFutureBuilder<T> extends FutureBuilder<T> {
  AnimatedFutureBuilder({
    @required Future<T> future,
    @required DataBuilder<T> builder,
    WidgetBuilder nullBuilder,
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
            Widget widget;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                if (loading != null) {
                  widget = loading(context);
                } else {
                  widget = Container();
                }
                break;
              case ConnectionState.active:
                if (snapshot.hasError) {
                  if (error != null) {
                    widget = error(context, snapshot.error);
                  } else {
                    widget = Text('${snapshot.error}');
                  }
                } else {
                  if (snapshot.hasData) {
                    widget = builder(context, snapshot.data);
                  } else {
                    if (nullBuilder != null) {
                      widget = nullBuilder(context);
                    } else {
                      widget = builder(context, snapshot.data);
                    }
                  }
                }
                break;
              case ConnectionState.done:
                if (error != null) {
                  widget = error(context, 'ConnectionState.done');
                } else {
                  widget = Text('ConnectionState.done');
                }
                break;
            }
            return AnimatedSwitcher(
              duration: duration,
              child: widget,
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
    WidgetBuilder nullBuilder,
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
            Widget widget;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                if (loading != null) {
                  widget = loading(context);
                } else {
                  widget = Container();
                }
                break;
              case ConnectionState.active:
                if (snapshot.hasError) {
                  if (error != null) {
                    widget = error(context, snapshot.error);
                  } else {
                    widget = Text('${snapshot.error}');
                  }
                } else {
                  if (snapshot.hasData) {
                    if (snapshot.data.isEmpty) {
                      if (empty != null) {
                        widget = empty(context);
                      } else {
                        widget = builder(context, snapshot.data);
                      }
                    } else {
                      widget = builder(context, snapshot.data);
                    }
                  } else {
                    if (nullBuilder != null) {
                      widget = nullBuilder(context);
                    } else {
                      widget = builder(context, snapshot.data);
                    }
                  }
                }
                break;
              case ConnectionState.done:
                if (error != null) {
                  widget = error(context, 'ConnectionState.done');
                } else {
                  widget = Text('ConnectionState.done');
                }
                break;
            }
            return AnimatedSwitcher(
              duration: duration,
              child: widget,
              reverseDuration: reverseDuration,
              switchInCurve: switchInCurve,
              switchOutCurve: switchOutCurve,
              transitionBuilder: transitionBuilder,
              layoutBuilder: layoutBuilder,
            );
          },
        );
}
