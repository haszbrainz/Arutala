import 'api_status.dart';

class ApiResponse<T> {
  ApiStatus? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.init() : status = ApiStatus.INIT;

  ApiResponse.loading() : status = ApiStatus.LOADING;

  ApiResponse.success(this.data) : status = ApiStatus.SUCCESS;

  ApiResponse.error(this.message) : status = ApiStatus.ERROR;

  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $data';
  }
}
