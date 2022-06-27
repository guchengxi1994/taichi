abstract class AbstractOperation<T> {
  String expression;
  AbstractOperation({required this.expression});

  T? getResult();
}
