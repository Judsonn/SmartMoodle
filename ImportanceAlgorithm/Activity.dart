
class Activity {
  double importance;
  double percentage;
  double hours;

  double get act_impor{
    return importance;
  }

  void set act_impor(double importance){
    this.importance = importance;
  }

  double get act_perce{
    return percentage;
  }

  void set act_perce(double percentage){
    this.percentage = percentage;
  }

  double get act_hours {
    return hours;
  }

  void set act_hours(double hours){
    this.hours = hours;
  }

  double calc_priority(double importance, double percentage, double hours){
    double priority = (percentage * 0.01) / importance;
    priority = priority * hours;
    return priority;
  }
}

main(double importance, double percentage, double hours) {
  Activity act = new Activity();
  double priori = act.calc_priority(importance, percentage, hours);
  print(priori);
}