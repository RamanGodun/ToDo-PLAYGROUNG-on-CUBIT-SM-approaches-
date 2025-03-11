import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/enums.dart';

part 'todo_filter_state.dart';

class TodoFilterCubit extends Cubit<TodoFilterStateOnCubit> {
  TodoFilterCubit() : super(TodoFilterStateOnCubit.initial());

  void changeFilter(Filter newFilter) {
    emit(state.copyWith(filter: newFilter));
  }
}
