abstract class ReorderSessionsListState {
  final List<Map<String, dynamic>> items;

  ReorderSessionsListState({required this.items});
}

class ReorderSessionsListInitialState extends ReorderSessionsListState {
  ReorderSessionsListInitialState({required super.items});
}

class ReorderedSessionsListState extends ReorderSessionsListState {
  ReorderedSessionsListState({required super.items});
}
