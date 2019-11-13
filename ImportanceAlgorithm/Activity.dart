import 'dart:ffi';

class Activity {
  Float importance;
  Float percentage;
  Float hours;

  Float get act_impor{
    return importance;
  }

  void set act_impor(Float importance){
    this.importance = importance;
  }

  Float get act_perce{
    return percentage;
  }

  void set act_perce(Float percentage){
    this.percentage = percentage;
  }

  Float get act_hours {
    return hours;
  }

  void set act_hours(Float hours){
    this.hours = hours;
  }

  Float calc_priority(Float importance, Float percentage, Float hours){
    Float priority = (percentage * 0.01) / importance;
    priority = priority * hours;
    return priority;
  }
}

main() {
  Float importance = 5;
  Float percentage = 50;
  Float hours = 48;
  Activity act = new Activity();
  Float priori = act.calc_priority(importance, percentage, hours);
  print(priori);
}