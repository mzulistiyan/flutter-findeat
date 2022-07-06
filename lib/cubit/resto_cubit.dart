import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_findeat/models/resto_model.dart';
import 'package:flutter_application_findeat/services/resto_service.dart';

part 'resto_state.dart';

class RestoCubit extends Cubit<RestoState> {
  RestoCubit() : super(RestoInitial());
  void fetchResto() async {
    try {
      emit(RestoLoading());

      List<RestoModel> restos = await RestoService().fetchRestos();

      emit(RestoSuccess(restos));
    } catch (e) {
      emit(RestoFailed(e.toString()));
    }
  }
}
