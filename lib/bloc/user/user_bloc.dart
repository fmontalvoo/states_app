import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';

import 'package:states_app/models/user.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) {
    return null;
  }
}
