import 'package:SmartMoodle/helpers/user_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:SmartMoodle/models/UserActivities.dart';
import 'package:SmartMoodle/services/moodle.dart';
import 'package:mobx/mobx.dart';

part 'my_activities_base.g.dart';

class MyActivities = MyActivitiesBase with _$MyActivities;

abstract class MyActivitiesBase with Store {
  MoodleAPI moodleAPI = MoodleAPI();

  @observable
  UserActivities userActivities;

  @action
  getUserAtivities() async {
    List<String> tokens = await UserPreferences.getSession();

    Map<String, dynamic> json = await moodleAPI.userActivities(tokens[0]);
    userActivities = UserActivities.fromJson(json);
  }

  @action
  setNotification(int timestart) async {
    // INSERIR A NOTIFICAÇÃO
  }

  initialNotificationConfig() {}
}
