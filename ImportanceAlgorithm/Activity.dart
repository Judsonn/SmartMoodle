
class Activity {
  double difficulty;
  double weight;
  double knowledge;
  double hours;

  double get act_difficulty{
    return difficulty;
  }

  void set act_difficulty(double difficulty){
    this.difficulty = difficulty;
  }

  double get act_weight{
    return weight;
  }

  void set act_weight(double weight){
    this.weight = weight;
  }

  double get act_knowledge{
    return knowledge;
  }

  void set act_knowledge(double knowledge){
    this.knowledge = knowledge;
  }

  double get act_hours {
    return hours;
  }

  void set act_hours(double hours){
    this.hours = hours;
  }

  double calc_priority(double difficulty, double weight, double knowledge, double hours){
    double priority = ((knowledge * 0.01) / difficulty) * weight;
    priority = priority * hours;
    return priority;
  }
}

main(double difficulty, double weight, double knowledge, double hours) {
  Activity act = new Activity();
  double priori = act.calc_priority(difficulty, weight, knowledge, hours);
  print(priori);
}