import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_model.freezed.dart';

part 'base_response_model.g.dart';

@Freezed(genericArgumentFactories: true)
abtract class BaseResponseModel<T> with _$BaseResponseModel<T> {

  const factory BaseResponseModel({
    @Default(false) bool success,
    String? message,
    T? data,
    @Default(0) int statusCode,
    dynamic error,
  }) = _BaseResponseModel;

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$BaseResponseModelFromJson(json, fromJsonT);

  // Helper methods
  factory BaseResponseModel.success({
    T? data,
    String? message,
    int statusCode = 200,
  }) {
    return BaseResponseModel(
      success: true,
      message: message,
      data: data,
      statusCode: statusCode,
    );
  }

  factory BaseResponseModel.error({
    String? message,
    int statusCode = 400,
    dynamic error,
  }) {
    return BaseResponseModel(
      success: false,
      message: message,
      statusCode: statusCode,
      error: error,
    );
  }

  // Utility getters
  bool get isSuccess => success && error == null;

  bool get isError => !success || error != null;
}
