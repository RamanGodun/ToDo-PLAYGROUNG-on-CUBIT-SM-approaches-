import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_search_state.dart';

class TodoSearchCubit extends Cubit<TodoSearchStateOnCubit> {
  TodoSearchCubit() : super(TodoSearchStateOnCubit.initial());

  void setSearchTerm(String newSearchTerm) {
    emit(state.copyWith(searchTerm: newSearchTerm));
  }
}
