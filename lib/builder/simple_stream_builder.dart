import 'package:flutter/widgets.dart';
import 'package:flutter_async_builder/builder/builder_functions.dart';

class SimpleStreamBuilder<T> extends StreamBuilder<T> {
  SimpleStreamBuilder(
      {@required Stream<T> stream,
      @required DataBuilder<T> builder,
      ErrorBuilder error,
      WidgetBuilder loading,
      T initialData})
      : super(
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
                print(snapshot.error);
                return Center(
                  child: Text(
                    'an error occurred:\n' + snapshot.error.toString(),
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
            if (snapshot.data.isEmpty) {
              if (empty == null) {
                return Center(
                  child: Text('No data found'),
                );
              } else {
                return empty(context);
              }
            }
            return builder(context, snapshot.data);
          },
        );
}
