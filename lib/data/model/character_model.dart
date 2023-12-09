import 'package:valorant_prototype_app/data/model/voice_line.dart';

import 'ability_model.dart';

class CharacterModel {
  late List<AbilityModel>abilities;
 late VoiceLineModel voiceLineModel;
  String uuid,
      displayName,
      description,
      developerName,
      characterTags,
      displayIcon,
      displayIconSmall,
      bustPortrait,
      fullPortrait,
      fullPortraitV2,
      killfeedPortrait,
      background;

  CharacterModel(
      {required this.uuid,
      required this.displayName,
      required this.description,
      required this.developerName,
      required this.characterTags,
      required this.displayIcon,
      required this.displayIconSmall,
      required this.bustPortrait,
      required this.fullPortrait,
      required this.fullPortraitV2,
      required this.killfeedPortrait,
      required this.background});
}
