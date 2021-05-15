enum Status { request, loading, success, fail }

abstract class BaseResultStream<D, E> {
  D data;
  Status state;
  E error;
}
