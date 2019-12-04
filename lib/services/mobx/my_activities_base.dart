import 'dart:typed_data';

import 'package:SmartMoodle/helpers/user_preferences.dart';
import 'package:SmartMoodle/models/DatabaseActivityModel.dart';
import 'package:SmartMoodle/services/database.dart';
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
  setSaveLocalData(DataBaseActitivyModel activities) async {
    DatabaseServices.db.insertActivity(activities);
  }

// tem que configurar outras coisas no android manifest!!!
// DIFICULTY = PRIORITY
// COLOQUEI O TITULO DA ATIVIDADE OBRIGATÓRIA!!
// E OPCIONAL O RESTO, QUANDO CHAMAR ESSA FUNÇÃO, JÁ SABE :)

  @action
  scheduleNotification(String title,
      [int difficulty = 1,
      num weight = 1,
      num knowledge = 1,
      num hours = 1]) async {
    num priority = ((knowledge * 0.01) / difficulty) * weight;
    priority = priority * hours;

    int timeLeft = (DateTime.now()).millisecondsSinceEpoch + 114000;
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(milliseconds: timeLeft));

    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your other channel id',
        'your other channel name',
        'your other channel description');
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: "slow_spring_board.aiff");
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.schedule(
          0,
          'Ta na hora de realizar uma atividade',
          'Indicamos para você realizar a $title a partir de agora.',
          scheduledNotificationDateTime,
          platformChannelSpecifics);
    }
  }
}

// Comentei pra poder compilar já que tava mostrando erros
