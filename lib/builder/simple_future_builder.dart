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
            }
            if (!snapshot.hasData) {
              if (loading == null) {
                return Container();
              } else {
                return loading(context);
              }
            }
            if (snapshot.data.isEmpty) {
              if (empty == null) {
                return Container();
              } else {
                return empty(context);
              }
            }
            return builder(context, snapshot.data);
          },
        );
}
