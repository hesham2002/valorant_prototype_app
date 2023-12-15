import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valorant_prototype_app/data/model/ability_model.dart';
import 'package:valorant_prototype_app/data/model/voice_line.dart';

import '../data/model/character_model.dart';
import '../data/model/role_model.dart';
import '../data/repo/repo_layer.dart';

part 'agents_state.dart';

class AgentsCubit extends Cubit<AgentsState> {
  AgentsCubit(this.repositoryLayer) : super(AgentsInitialState());
  final RepositoryLayer repositoryLayer;

  Future<void> getAgent()async{
    try{
      emit(AgentsLoadingState());
      final listOfAgents =await requestAgents();
      emit(AgentsSuccessState(charList: listOfAgents));
    }catch(e){
      emit(AgentsFailureState(message: e.toString()));
    };
  }

  Future<List<CharacterModel>> requestAgents() async {
    try {
      final response = await repositoryLayer.getData();
      if (response == null) {
        return [];
      }
      final responseDecoded = json.decode(response.body);

      final loopedList = responseDecoded['data'] as List<dynamic>;
    final list =  loopedList.map((dynamic e) {
        final role = e['role'] ?? {};
        final roleInfo = Role(
            uuid: role['uuid'] ?? '',
            displayIcon: role['displayIcon'] ?? '',
            description: role['description'] ?? '',
            displayName: role['displayName'] ?? '');

        final ability = e['abilities'] as List<dynamic>;
        final abilityInfo = ability.map((a) {
          return AbilityModel(
              slot: a['slot'] ?? '',
              displayName: a['displayName'] ?? '',
              description: a['description'] ?? '',
              displayIcon: a['displayIcon'] ?? '');
        }).toList();
        abilityInfo.retainWhere((element) => element.displayIcon.isNotEmpty);

        final voiceLine = e['voiceLine'] ?? '';

        final voiceMediaList = voiceLine['mediaList'] as List;
        final voiceMedia = VoiceLineModel(voiceLine: voiceMediaList[0]['wave']);

        return CharacterModel(
            uuid: e['uuid'] ?? '',
            displayName: e['displayName'] ?? '',
            description: e['description'] ?? '',
            developerName: e['developerName'] ?? '',
            characterTags: e['characterTags'] ?? '',
            displayIcon: e['displayIcon'] ?? '',
            displayIconSmall: e['displayIconSmall'] ?? '',
            bustPortrait: e['bustPortrait'] ?? '',
            fullPortrait: e['fullPortrait'] ?? '',
            fullPortraitV2: e['fullPortraitV2'] ?? '',
            killfeedPortrait: e['killfeedPortrait'] ?? '',
            background: e['background'] ?? '',
            abilities: abilityInfo,
            voiceLineModel: voiceMedia,
            role: roleInfo);
      }).toSet().toList();
      
     list.retainWhere((element) => element.fullPortrait.isNotEmpty);
     return list;
    } catch (e) {

      throw Exception(e.toString());
    }
  }
}
