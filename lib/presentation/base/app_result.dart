enum States { success, failure }

class AppResult<T> {
  States status;
  T data;
  String error;

  AppResult.success([T result]) {
    status = States.success;
    data = result;
  }

  AppResult.failure([String errorDetail, T result]) {
    status = States.failure;
    error = errorDetail;
    data = result;
  }
}
