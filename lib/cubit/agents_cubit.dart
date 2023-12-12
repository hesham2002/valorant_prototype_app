import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/model/character_model.dart';

part 'agents_state.dart';

class AgentsCubit extends Cubit<AgentsState> {
  AgentsCubit() : super(AgentsInitialState());
}
