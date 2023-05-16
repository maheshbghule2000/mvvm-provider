import 'status.dart';
import '';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);
  ApiResponse.compleated() : status = Status.COMPLETED;
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    // TODO: implement toString
    return "status: $status\n message: $message\n data: $data\n";
  }
}
