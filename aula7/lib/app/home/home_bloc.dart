import 'package:rxdart/subjects.dart';

class HomeBloc {
  HomeBloc() {
    streamOut = _count.stream;
    _streamIn = _count.sink;
    titles =
        _count.map((event) => List.generate(event, (index) => "Count $index"));
  }

  final _count = BehaviorSubject<int>.seeded(0);
  Sink<int> _streamIn;
  Stream<int> streamOut;
  int get value => _count.value;

  Stream<List<String>> titles;

  void increment() {
    var actual = value;
    actual++;
    _streamIn.add(actual);
  }

  void dispose() {
    _count.close();
    _streamIn.close();
  }
}
