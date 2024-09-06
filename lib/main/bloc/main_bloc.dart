import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_market/utils/utils.dart';


part 'main_event.dart';
part 'main_state.dart';
part 'main_bloc.freezed.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      user?.toString().printDLog;
      add(UpdateUser(user));
      if (user == null) {
        add(const ChangeLogin(false));
      } else {
        add(const ChangeLogin(true));
      }
    });
    on<Started>(started);
    on<ChangeLogin>(changeLogin);
    on<UpdateUser>(updateUser);
  }
  updateUser(UpdateUser event, Emitter<MainState> emit) async {
    emit(state.copyWith(user: event.user));
  }

  started(Started event, Emitter<MainState> emit) async {
    try {
      
    } catch (e) {
      e.printELog;
    } finally {}
  }

  changeLogin(ChangeLogin event, Emitter<MainState> emit) async {
    try {
      emit(state.copyWith(isLogin: event.value));
    } catch (e) {
      e.printELog;
    } finally {}
  }
}
