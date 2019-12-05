// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_activities_base.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyActivities on MyActivitiesBase, Store {
  final _$userActivitiesAtom = Atom(name: 'MyActivitiesBase.userActivities');

  @override
  UserActivities get userActivities {
    _$userActivitiesAtom.context.enforceReadPolicy(_$userActivitiesAtom);
    _$userActivitiesAtom.reportObserved();
    return super.userActivities;
  }

  @override
  set userActivities(UserActivities value) {
    _$userActivitiesAtom.context.conditionallyRunInAction(() {
      super.userActivities = value;
      _$userActivitiesAtom.reportChanged();
    }, _$userActivitiesAtom, name: '${_$userActivitiesAtom.name}_set');
  }

  final _$getUserAtivitiesAsyncAction = AsyncAction('getUserAtivities');

  @override
  Future getUserAtivities() {
    return _$getUserAtivitiesAsyncAction.run(() => super.getUserAtivities());
  }

  final _$setSaveLocalDataAsyncAction = AsyncAction('setSaveLocalData');

  @override
  Future setSaveLocalData(DataBaseActitivyModel activities) {
    return _$setSaveLocalDataAsyncAction
        .run(() => super.setSaveLocalData(activities));
  }

  final _$scheduleNotificationAsyncAction = AsyncAction('scheduleNotification');

  @override
  Future scheduleNotification(String title,
      [int difficulty = 1, num weight = 1, num knowledge = 1, num hours = 1]) {
    return _$scheduleNotificationAsyncAction.run(() => super
        .scheduleNotification(title, difficulty, weight, knowledge, hours));
  }
}
