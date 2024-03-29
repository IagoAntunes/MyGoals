abstract class IResponseService {
  String message;
  IResponseService({
    required this.message,
  });
}

class SuccessMessageResponseService extends IResponseService {
  SuccessMessageResponseService({required super.message});
}

class FailureMessageResponseService extends IResponseService {
  FailureMessageResponseService({required super.message});
}

class SuccessResponseService<T> extends IResponseService {
  T value;
  SuccessResponseService({
    required this.value,
    required super.message,
  });
}

class FailureResponseService<T> extends IResponseService {
  T value;
  FailureResponseService({
    required this.value,
    required super.message,
  });
}
