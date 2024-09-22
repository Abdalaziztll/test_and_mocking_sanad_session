// ignore_for_file: public_member_api_docs, sort_constructors_first
class PureData {}

class DataSuccess<T> extends PureData {
  List<T> list;
  DataSuccess({
    required this.list,
  });
}

class DataFailed extends PureData {}
