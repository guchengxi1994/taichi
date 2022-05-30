part of 'entities.dart';

class MatcherEntity {
  List<String> operators;
  List<String> formulas;

  MatcherEntity({required this.formulas, required this.operators})
      : assert(formulas.isNotEmpty && formulas.length == operators.length + 1);

  bool getResult(List<Policy> ps, Request r) {
    return ps.indexWhere((element) => element.equalsByFomula(r, this)) != -1;
  }
}
