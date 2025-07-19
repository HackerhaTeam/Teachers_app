abstract class SessionsListState {
    final List<Map<String, dynamic>> items;

  SessionsListState({required this.items});
}

class SessionsListInitialState extends SessionsListState{
  SessionsListInitialState({required super.items});
}


class SessionsListUpdateState extends SessionsListState{
  SessionsListUpdateState({required super.items});
}
