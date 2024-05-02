import '../../../../core/shared/shared.dart';
import '../../team.dart';

class TeamModel extends TeamEntity {
  TeamModel({
    required super.name,
    required super.flag,
  });

  factory TeamModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      assert(
        map.containsKey('name'),
        "TeamModel.parse: map doesn't contain key 'name'",
      );
       assert(
        map['name'] is String,
        "TeamModel.parse: map['name'] is not a String",
      );
      assert(
        map.containsKey('flag'),
        "TeamModel.parse: map doesn't contain key 'flag'",
      );
       assert(
        map['flag'] is String,
        "TeamModel.parse: map['flag'] is not a String",
      );
      return TeamModel(
        name: map['name'],
        flag: map['flag'],
      );
    } catch (e, stackTrace) {
      throw TeamModelParsingFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
