import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/models/CharModel.dart';
import 'package:flutter_application_1/services/CharaServices.dart';
import 'package:meta/meta.dart';

part 'charcter_state.dart';

class CharcterCubit extends Cubit<CharcterState> {
  CharcterCubit() : super(CharcterInitial());
  Future<List<CharacterModel>> getCharter() async {
    emit(CharcterLoading());
    try {
      List<CharacterModel> ListCharter = await CharacterServices().getCharter();
      emit(CharcterSuccess(SuccessList: ListCharter));
      return ListCharter;
    } on Exception catch (e) {
      emit(CharcterFailer(e.toString()));
    }
    return [];
  }
}
