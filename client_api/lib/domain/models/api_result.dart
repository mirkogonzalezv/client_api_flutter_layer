import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.exito({required T data}) = Exito<T>;
  const factory ApiResult.fallo({required Exception error}) = Error<T>;
}
