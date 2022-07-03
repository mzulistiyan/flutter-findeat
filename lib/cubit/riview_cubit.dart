import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_findeat/models/riview_model.dart';
import 'package:flutter_application_findeat/services/riview_service.dart';

part 'riview_state.dart';

class RiviewCubit extends Cubit<RiviewState> {
  RiviewCubit() : super(RiviewInitial());

  void createCourse(
    RiviewModel riview,
  ) async {
    try {
      emit(RiviewLoading());
      await RiviewService().createRiview(
        riview,
      );
      emit(RiviewSuccess(const []));
    } catch (e) {
      emit(RiviewFailed(e.toString()));
    }
  }

  void fetchCourse(String idResto) async {
    try {
      emit(RiviewLoading());

      List<RiviewModel> riviews = await RiviewService().fetchRiview(idResto);

      emit(RiviewSuccess(riviews));
    } catch (e) {
      emit(RiviewFailed(e.toString()));
    }
  }
}
